class WeatherCondition {
  int code;
  String icon;
  String text;

  WeatherCondition({this.code, this.icon, this.text});

  WeatherCondition.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    icon = json['icon'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['icon'] = this.icon;
    data['text'] = this.text;
    return data;
  }
}
