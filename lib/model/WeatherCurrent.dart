import 'WeatherCondition.dart';

class WeatherCurrent {
  double feelslikeC;
  double uv;
  String lastUpdated;
  double feelslikeF;
  int windDegree;
  int lastUpdatedEpoch;
  int isDay;
  double precipIn;
  String windDir;
  double gustMph;
  double tempC;
  double pressureIn;
  double gustKph;
  double tempF;
  double precipMm;
  int cloud;
  double windKph;
  WeatherCondition condition;
  double windMph;
  double visKm;
  int humidity;
  double pressureMb;
  double visMiles;

  WeatherCurrent(
      {this.feelslikeC,
      this.uv,
      this.lastUpdated,
      this.feelslikeF,
      this.windDegree,
      this.lastUpdatedEpoch,
      this.isDay,
      this.precipIn,
      this.windDir,
      this.gustMph,
      this.tempC,
      this.pressureIn,
      this.gustKph,
      this.tempF,
      this.precipMm,
      this.cloud,
      this.windKph,
      this.condition,
      this.windMph,
      this.visKm,
      this.humidity,
      this.pressureMb,
      this.visMiles});

  WeatherCurrent.fromJson(Map<String, dynamic> json) {
    feelslikeC = json['feelslike_c'];
    uv = json['uv'];
    lastUpdated = json['last_updated'];
    feelslikeF = json['feelslike_f'];
    windDegree = json['wind_degree'];
    lastUpdatedEpoch = json['last_updated_epoch'];
    isDay = json['is_day'];
    precipIn = json['precip_in'];
    windDir = json['wind_dir'];
    gustMph = json['gust_mph'];
    tempC = json['temp_c'];
    pressureIn = json['pressure_in'];
    gustKph = json['gust_kph'];
    tempF = json['temp_f'];
    precipMm = json['precip_mm'];
    cloud = json['cloud'];
    windKph = json['wind_kph'];
    condition = json['condition'] != null
        ? new WeatherCondition.fromJson(json['condition'])
        : null;
    windMph = json['wind_mph'];
    visKm = json['vis_km'];
    humidity = json['humidity'];
    pressureMb = json['pressure_mb'];
    visMiles = json['vis_miles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feelslike_c'] = this.feelslikeC;
    data['uv'] = this.uv;
    data['last_updated'] = this.lastUpdated;
    data['feelslike_f'] = this.feelslikeF;
    data['wind_degree'] = this.windDegree;
    data['last_updated_epoch'] = this.lastUpdatedEpoch;
    data['is_day'] = this.isDay;
    data['precip_in'] = this.precipIn;
    data['wind_dir'] = this.windDir;
    data['gust_mph'] = this.gustMph;
    data['temp_c'] = this.tempC;
    data['pressure_in'] = this.pressureIn;
    data['gust_kph'] = this.gustKph;
    data['temp_f'] = this.tempF;
    data['precip_mm'] = this.precipMm;
    data['cloud'] = this.cloud;
    data['wind_kph'] = this.windKph;
    if (this.condition != null) {
      data['condition'] = this.condition.toJson();
    }
    data['wind_mph'] = this.windMph;
    data['vis_km'] = this.visKm;
    data['humidity'] = this.humidity;
    data['pressure_mb'] = this.pressureMb;
    data['vis_miles'] = this.visMiles;
    return data;
  }
}
