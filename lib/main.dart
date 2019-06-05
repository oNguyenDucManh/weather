import 'package:flutter/material.dart';
import 'config/API.dart';
import 'model/ForeCastForecastday.dart';
import 'model/ForeCastResponse.dart';
import 'package:intl/intl.dart';
import 'config/IconWeather.dart';
import 'package:fcharts/fcharts.dart';
import 'demoChart.dart';

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
  Future<ForeCastResponse> weather;
  final xAxis = new ChartAxis<String>();

  @override
  void initState() {
    super.initState();
    weather = API.fetchForeCast("ha noi", 7);
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
                child: FutureBuilder<ForeCastResponse>(
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
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              _getNameDayOfWeek(
                                                      DateTime.now().weekday,
                                                      false) +
                                                  " " +
                                                  _formatCurrentTime(DateTime
                                                          .now()
                                                      .millisecondsSinceEpoch),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14)),
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
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 180),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    IconWeather.getIconWeather(
                                        snapshot.data.current.condition),
                                    width: 124,
                                    height: 124,
                                  ),
                                  Text(
                                    snapshot.data.current.tempC
                                            .round()
                                            .toString() +
                                        "°",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 80,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    "${snapshot.data.current.condition.text}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ])),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              height: 150,
                              margin: EdgeInsets.only(bottom: 24),
//                            child: Sparkline(
//                                data: _getDataWeather(
//                                    snapshot.data.forecast.forecastday),
//                                lineColor: Colors.white,
//                                pointsMode: PointsMode.all,
//                                pointSize: 8.0,
//                                pointColor: Colors.white, sharpCorners: false,),
                              child: new LineChart(
                                chartPadding: new EdgeInsets.fromLTRB(
                                    60.0, 20.0, 30.0, 30.0),
                                lines: [
                                  new Line<ForeCastForecastday, String, double>(
                                    data: snapshot.data.forecast.forecastday,
                                    xFn: (forecastday) =>
                                        _formatDateFromTimeStamp(
                                            forecastday.dateEpoch),
                                    yFn: (forecastday) =>
                                        forecastday.day.avgtempC,
                                    xAxis: new ChartAxis<String>(
                                      paint: const PaintOptions.stroke(
                                          color: Colors.white),
                                      tickLabelerStyle: new TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    yAxis: new ChartAxis(
                                      span: new DoubleSpan(
                                          _getMinWeather(snapshot
                                                  .data.forecast.forecastday) -
                                              1,
                                          _getMaxWeather(snapshot
                                                  .data.forecast.forecastday) +
                                              1),
                                      opposite: false,
                                      tickGenerator:
                                          IntervalTickGenerator.byN(2),
                                      paint: const PaintOptions.stroke(
                                          color: Colors.white),
                                      tickLabelerStyle: new TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    marker: const MarkerOptions(
                                      paint: const PaintOptions.fill(
                                          color: Colors.white),
                                      shape: MarkerShapes.circle,
                                    ),
                                    stroke: const PaintOptions.stroke(
                                        color: Colors.white),
//                                    legend: new LegendItem(
//                                      paint: const PaintOptions.fill(
//                                          color: Colors.white),
//                                      text: 'Size',
//                                    ),
                                  ),
                                ],
                              )),
                        )
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
    return _getNameDayOfWeek(
        DateTime.fromMillisecondsSinceEpoch(lastUpdatedEpoch * 1000).weekday,
        true);
  }

  String _formatCurrentTime(int time) {
    return DateFormat('dd/MM/yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(time));
  }

  String _getNameDayOfWeek(int day, bool isShort) {
    switch (day) {
      case 1:
        return isShort ? "T2" : "Thứ 2";
      case 2:
        return isShort ? "T3" : "Thứ 3";
      case 3:
        return isShort ? "T4" : "Thứ 4";
      case 4:
        return isShort ? "T5" : "Thứ 5";
      case 5:
        return isShort ? "T6" : "Thứ 6";
      case 6:
        return isShort ? "T7" : "Thứ 7";
      case 7:
        return isShort ? "CN" : "Chủ nhật";
      default:
        return "Unknow";
    }
  }

  double _getMinWeather(List<ForeCastForecastday> forecastday) {
    double min = forecastday[0].day.avgtempC;
    for (int i = 0; i < forecastday.length; i++) {
      if (min > forecastday[i].day.avgtempC) {
        min = forecastday[i].day.avgtempC;
      }
    }
    return min;
  }

  double _getMaxWeather(List<ForeCastForecastday> forecastday) {
    double max = forecastday[0].day.avgtempC;
    for (int i = 0; i < forecastday.length; i++) {
      if (max < forecastday[i].day.avgtempC) {
        max = forecastday[i].day.avgtempC;
      }
    }
    return max;
  }
}
