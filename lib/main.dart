import 'package:flutter/material.dart';
import 'config/API.dart';
import 'model/WeatherResponse.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My Weather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<WeatherEntity> weather;

  @override
  void initState() {
    super.initState();
    weather = API.fetchWeather("ha noi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text(widget.title),
//        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // Add one stop for each color. Stops should increase from 0 to 1
//          stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Color.fromRGBO(253, 195, 146, 1),
                  Color.fromRGBO(253, 168, 144, 1),
                  // Colors are easy thanks to Flutter's Colors class.
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Container(
                child: FutureBuilder<WeatherEntity>(
                  future: weather,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Stack(children: <Widget>[
                        Container(
                          height: 120,
                          child: Padding(
                              padding: EdgeInsets.only(left: 32, top: 20),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset(
                                      "images/hanoi_circle.png",
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            snapshot.data.location.name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              _getNameDayOfWeek(
                                                      DateTime.now().weekday) +
                                                  " " +
                                                  _formatCurrentTime(
                                                      DateTime.now()
                                                          .millisecondsSinceEpoch),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ))
                                ],
                              )),
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Opacity(
                              opacity: 0.2,
                              child: Image.asset(
                                "images/hanoi.png",
                              ),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 180),
                            child: Column(children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.network(
                                    "https:${snapshot.data.current.condition.icon}",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                  Text(
                                    snapshot.data.current.tempC
                                            .round()
                                            .toString() +
                                        "°",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 80,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "\nĐã cập nhật ${_formatDateFromTimeStamp(snapshot.data.current.lastUpdatedEpoch)}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  )
                                ],
                              ),
                              Center(
                                  child: Text(
                                "${snapshot.data.current.condition.text}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              )),
                            ]))
                      ]);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            )));
  }

  String _formatDateFromTimeStamp(int lastUpdatedEpoch) {
    return DateFormat('dd/MM/yyyy HH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(lastUpdatedEpoch * 1000));
  }
  String _formatCurrentTime(int time) {
    return DateFormat('dd/MM/yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(time));
  }

  String _getNameDayOfWeek(int day) {
    switch (day) {
      case 1:
        return "Thứ 2";
      case 2:
        return "Thứ 3";
      case 3:
        return "Thứ 4";
      case 4:
        return "Thứ 5";
      case 5:
        return "Thứ 6";
      case 6:
        return "Thứ 7";
      case 7:
        return "Chủ nhật";
      default:
        return "Unknow";
    }
  }
}
