import 'package:vietnam_weather/model/WeatherCondition.dart';

class IconWeather {
  static String getIconWeather(WeatherCondition condition) {
    if (condition != null) {
      if (condition.code == 1003) {
        return "images/weather/044-cloud.png";
      } else {
        return "images/weather/044-cloud.png";
      }
    } else {
      return "";
    }
  }
}
