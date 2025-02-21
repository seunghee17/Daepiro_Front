class CheckShowCurrentLocation {
  int? code;
  String? message;
  bool? data;
  String? path;
  String? timestamp;

  CheckShowCurrentLocation(
      {this.code, this.message, this.data, this.path, this.timestamp});

  CheckShowCurrentLocation.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['data'] = this.data;
    data['path'] = this.path;
    data['timestamp'] = this.timestamp;
    return data;
  }
}