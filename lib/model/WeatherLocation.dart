class WeatherLocation {
  String localtime;
  String country;
  int localtimeEpoch;
  String name;
  double lon;
  String region;
  double lat;
  String tzId;

  WeatherLocation(
      {this.localtime,
      this.country,
      this.localtimeEpoch,
      this.name,
      this.lon,
      this.region,
      this.lat,
      this.tzId});

  WeatherLocation.fromJson(Map<String, dynamic> json) {
    localtime = json['localtime'];
    country = json['country'];
    localtimeEpoch = json['localtime_epoch'];
    name = json['name'];
    lon = json['lon'];
    region = json['region'];
    lat = json['lat'];
    tzId = json['tz_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localtime'] = this.localtime;
    data['country'] = this.country;
    data['localtime_epoch'] = this.localtimeEpoch;
    data['name'] = this.name;
    data['lon'] = this.lon;
    data['region'] = this.region;
    data['lat'] = this.lat;
    data['tz_id'] = this.tzId;
    return data;
  }
}
