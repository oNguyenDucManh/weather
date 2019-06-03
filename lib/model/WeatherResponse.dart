import 'WeatherCurrent.dart';
import 'WeatherLocation.dart';

class WeatherEntity {
  WeatherCurrent current;
  WeatherLocation location;

  WeatherEntity({this.current, this.location});

  WeatherEntity.fromJson(Map<String, dynamic> json) {
    current = json['current'] != null
        ? new WeatherCurrent.fromJson(json['current'])
        : null;
    location = json['location'] != null
        ? new WeatherLocation.fromJson(json['location'])
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
    return data;
  }
}
