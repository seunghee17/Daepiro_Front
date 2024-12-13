class DisasterContentsResponse {
  int? code;
  String? message;
  Data? data;
  String? path;
  String? timestamp;

  DisasterContentsResponse(
      this.code,
      this.message,
      this.data,
      this.path,
      this.timestamp
  );

  DisasterContentsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? disasterType;
  String? title;
  String? time;

  Data({
    this.disasterType,
    this.title,
    this.time,
  });

  Data.fromJson(Map<String, dynamic> json) {
    disasterType = json['disasterType'];
    title = json['title'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disasterType'] = this.disasterType;
    data['title'] = this.title;
    data['time'] = this.time;
    return data;
  }
}