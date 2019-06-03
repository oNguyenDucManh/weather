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
        body: SafeArea(
            child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("images/night_moon.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: FutureBuilder<WeatherEntity>(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
//            return Text(snapshot.data.location.country +
//                "\n" +
//                snapshot.data.current.condition.text);
            return Stack(children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Column(children: <Widget>[
                    Center(
                        child: Text(
                      snapshot.data.location.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.normal),
                    )),
                    Center(
                        child: Text(
                      "\nĐã cập nhật ${_formatDateFromTimeStamp(snapshot.data.current.lastUpdatedEpoch)}",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                            "https:${snapshot.data.current.condition.icon}"),
                        Text(
                          snapshot.data.current.tempC.round().toString() + "˚",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    Center(
                        child: Text("${snapshot.data.current.condition.text}",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )),
                  ]))
            ]);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    )));
  }

  String _formatDateFromTimeStamp(int lastUpdatedEpoch) {
    return DateFormat('dd/MM/yyyy HH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(lastUpdatedEpoch * 1000));
  }
}
