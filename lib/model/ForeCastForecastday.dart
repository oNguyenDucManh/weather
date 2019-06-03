import 'ForeCastForecastdayAstro.dart';
import 'ForeCastForecastdayDay.dart';

class ForeCastForecastday {
  String date;
  ForeCastForecastdayAstro astro;
  int dateEpoch;
  ForeCastForecastdayDay day;

  ForeCastForecastday({this.date, this.astro, this.dateEpoch, this.day});

  ForeCastForecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    astro = json['astro'] != null ? new ForeCastForecastdayAstro.fromJson(json['astro']) : null;
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? new ForeCastForecastdayDay.fromJson(json['day']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.astro != null) {
      data['astro'] = this.astro.toJson();
    }
    data['date_epoch'] = this.dateEpoch;
    if (this.day != null) {
      data['day'] = this.day.toJson();
    }
    return data;
  }
}