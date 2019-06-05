import 'package:vietnam_weather/model/fore_caset_forecastday_day_entity.dart';
import 'package:vietnam_weather/model/ForeCastEntity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ForeCasetForecastdayDayEntity") {
      return ForeCasetForecastdayDayEntity.fromJson(json) as T;
    } else if (T.toString() == "ForeCastEntity") {
      return ForeCastEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}