class ForeCastForecastdayAstro {
  String moonset;
  String sunrise;
  String sunset;
  String moonrise;

  ForeCastForecastdayAstro({this.moonset, this.sunrise, this.sunset, this.moonrise});

  ForeCastForecastdayAstro.fromJson(Map<String, dynamic> json) {
    moonset = json['moonset'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moonset'] = this.moonset;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['moonrise'] = this.moonrise;
    return data;
  }
}