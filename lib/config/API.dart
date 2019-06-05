import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vietnam_weather/config/Config.dart';
import 'package:vietnam_weather/model/ForeCastResponse.dart';
import 'package:vietnam_weather/model/WeatherResponse.dart';
import 'Config.dart';

class API {
//  Future<http.Response> fetchWeather(String key) {
//    return http.get(Config.KEY_API + "&q" + key);
//  }

  static Future<WeatherEntity> fetchWeather(String key) async {
    final response = await http.get(Config.END_POINT +
        "current.json?key=" +
        Config.KEY_API +
        "&lang=vi&q=" +
        key);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return WeatherEntity.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<ForeCastResponse> fetchForeCast(String key, int days) async {
    final response = await http.get(Config.END_POINT +
        "forecast.json?key=" +
        Config.KEY_API +
        "&lang=vi&q=" +
        key +
        "&days=" +
        days.toString());

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return ForeCastResponse.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
