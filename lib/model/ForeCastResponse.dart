import 'ForeCastEntity.dart';
import 'WeatherCurrent.dart';
import 'WeatherLocation.dart';

class ForeCastResponse {
  WeatherCurrent current;
  WeatherLocation location;
  ForeCastEntity forecast;

  ForeCastResponse({this.current, this.location, this.forecast});

  ForeCastResponse.fromJson(Map<String, dynamic> json) {
    current = json['current'] != null
        ? new WeatherCurrent.fromJson(json['current'])
        : null;
    location = json['location'] != null
        ? new WeatherLocation.fromJson(json['location'])
        : null;
    forecast = json['forecast'] != null
        ? new ForeCastEntity.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.current != null) {
      data['current'] = this.current.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.forecast != null) {
      data['forecast'] = this.forecast.toJson();
    }
    return data;
  }
}
