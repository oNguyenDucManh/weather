import 'package:fcharts/fcharts.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'data.dart';

/// A city in the world.
@immutable
class City {
  const City(this.name, this.coolness, this.size);

  /// The name of the city.
  final String name;

  /// How cool this city is, this is how we measure the city in the chart.
  final Level coolness;

  /// How big the city is on a scale from 1 to 10.
  final int size;
}

/// Our city data.
const cities = [
  const City("District X", Level.Not, 7),
  const City("Gotham", Level.Kinda, 8),
  const City("Mos Eisley", Level.Quite, 4),
  const City("Palo Alto", Level.Very, 5),
];

class CityLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // set x-axis here so that both lines can use it
    final xAxis = new ChartAxis<String>();

    return new AspectRatio(
      aspectRatio: 4 / 3,
      child: new LineChart(
        chartPadding: new EdgeInsets.fromLTRB(60.0, 20.0, 30.0, 30.0),
        lines: [
          new Line<City, String, int>(
            data: cities,
            xFn: (city) => city.name,
            yFn: (city) => city.size,
            xAxis: new ChartAxis<String>(
//              paint: const PaintOptions.stroke(color: Colors.green),
              tickLabelerStyle: new TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold),
            ),
            yAxis: new ChartAxis(
              span: new IntSpan(0, 20),
              opposite: false,
              tickGenerator: IntervalTickGenerator.byN(3),
              paint: const PaintOptions.stroke(color: Colors.green),
              tickLabelerStyle: new TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold),
            ),
            marker: const MarkerOptions(
              paint: const PaintOptions.fill(color: Colors.green),
              shape: MarkerShapes.circle,
            ),
            stroke: const PaintOptions.stroke(color: Colors.green),
            legend: new LegendItem(
              paint: const PaintOptions.fill(color: Colors.green),
              text: 'Size',
            ),
          ),
        ],
      ),
    );
  }
}
