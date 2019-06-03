import 'package:vietnam_weather/model/ForeCastResponse.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ForeCastEntity") {
      return ForeCastEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}