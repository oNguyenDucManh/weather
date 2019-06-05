import 'WeatherCondition.dart';

class ForeCastForecastdayDay {
  double avgvisKm;
  double uv;
  double avgtempF;
  double avgtempC;
  double maxtempC;
  double maxtempF;
  double mintempC;
  double avgvisMiles;
  double mintempF;
  double totalprecipIn;
  double avghumidity;
  WeatherCondition condition;
  double maxwindKph;
  double maxwindMph;
  double totalprecipMm;

  ForeCastForecastdayDay(
      {this.avgvisKm,
      this.uv,
      this.avgtempF,
      this.avgtempC,
      this.maxtempC,
      this.maxtempF,
      this.mintempC,
      this.avgvisMiles,
      this.mintempF,
      this.totalprecipIn,
      this.avghumidity,
      this.condition,
      this.maxwindKph,
      this.maxwindMph,
      this.totalprecipMm});

  ForeCastForecastdayDay.fromJson(Map<String, dynamic> json) {
    avgvisKm = json['avgvis_km'];
    uv = json['uv'];
    avgtempF = json['avgtemp_f'];
    avgtempC = json['avgtemp_c'];
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    avgvisMiles = json['avgvis_miles'];
    mintempF = json['mintemp_f'];
    totalprecipIn = json['totalprecip_in'];
    avghumidity = json['avghumidity'];
    condition = json['condition'] != null
        ? new WeatherCondition.fromJson(json['condition'])
        : null;
    maxwindKph = json['maxwind_kph'];
    maxwindMph = json['maxwind_mph'];
    totalprecipMm = json['totalprecip_mm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avgvis_km'] = this.avgvisKm;
    data['uv'] = this.uv;
    data['avgtemp_f'] = this.avgtempF;
    data['avgtemp_c'] = this.avgtempC;
    data['maxtemp_c'] = this.maxtempC;
    data['maxtemp_f'] = this.maxtempF;
    data['mintemp_c'] = this.mintempC;
    data['avgvis_miles'] = this.avgvisMiles;
    data['mintemp_f'] = this.mintempF;
    data['totalprecip_in'] = this.totalprecipIn;
    data['avghumidity'] = this.avghumidity;
    if (this.condition != null) {
      data['condition'] = this.condition.toJson();
    }
    data['maxwind_kph'] = this.maxwindKph;
    data['maxwind_mph'] = this.maxwindMph;
    data['totalprecip_mm'] = this.totalprecipMm;
    return data;
  }
}
