class UserAddressResponse {
  int? code;
  String? message;
  Data? data;
  String? path;
  String? timestamp;

  UserAddressResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  UserAddressResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['path'] = this.path;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Data {
  String? currentPosition;
  String? todayWeather;

  Data({this.currentPosition, this.todayWeather});

  Data.fromJson(Map<String, dynamic> json) {
    currentPosition = json['currentPosition'];
    todayWeather = json['todayWeather'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['currentPosition'] = this.currentPosition;
    data['todayWeather'] = this.todayWeather;
    return data;
  }
}
