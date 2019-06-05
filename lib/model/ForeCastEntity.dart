import 'ForeCastForecastday.dart';

class ForeCastEntity {
	List<ForeCastForecastday> forecastday;

	ForeCastEntity({this.forecastday});

	ForeCastEntity.fromJson(Map<String, dynamic> json) {
		if (json['forecastday'] != null) {
			forecastday = new List<ForeCastForecastday>();(json['forecastday'] as List).forEach((v) { forecastday.add(new ForeCastForecastday.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.forecastday != null) {
      data['forecastday'] =  this.forecastday.map((v) => v.toJson()).toList();
    }
		return data;
	}
}