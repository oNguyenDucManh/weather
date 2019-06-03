import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vietnam_weather/config/Config.dart';
import 'package:vietnam_weather/model/WeatherResponse.dart';

class API {
//  Future<http.Response> fetchWeather(String key) {
//    return http.get(Config.KEY_API + "&q" + key);
//  }

  static Future<WeatherEntity> fetchWeather(String key) async {
    final response =
        await http.get(Config.END_POINT + "&q=" + key);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return WeatherEntity.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
