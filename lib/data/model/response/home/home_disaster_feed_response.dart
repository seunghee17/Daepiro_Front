class HomeDisasterFeedResponse {
  int? code;
  String? message;
  HomeDisaster? data;
  String? path;
  String? timestamp;

  HomeDisasterFeedResponse(
      this.code,
      this.message,
      this.data,
      this.path,
      this.timestamp
  );

  HomeDisasterFeedResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? HomeDisaster.fromJson(json['data']) : null;
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['path'] = path;
    data['timestamp'] = timestamp;
    return data;
  }

}

class HomeDisaster {
  String? disasterType;
  int? disasterTypeId;
  String? title;
  String? content;
  String? time;

  HomeDisaster({
    this.disasterType,
    this.disasterTypeId,
    this.title,
    this.content,
    this.time,
  });

  HomeDisaster.fromJson(Map<String, dynamic> json) {
    disasterType = json['disasterType'];
    disasterTypeId = json['disasterTypeId'];
    title = json['title'];
    content = json['content'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disasterType'] = disasterType;
    data['disasterTypeId'] = disasterTypeId;
    data['title'] = title;
    data['content'] = content;
    data['time'] = time;
    return data;
  }
}