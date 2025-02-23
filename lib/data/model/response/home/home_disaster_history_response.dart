class HomeDisasterHistoryResponse {
  int? code;
  String? message;
  List<DisasterHistory>? data;
  String? path;
  String? timestamp;

  HomeDisasterHistoryResponse(
      this.code,
      this.message,
      this.data,
      this.path,
      this.timestamp
  );

  HomeDisasterHistoryResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = (json['data'] as List).map((item) => DisasterHistory.fromJson(item)).toList();
    }
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((item) => item.toJson()).toList();
    }
    data['path'] = path;
    data['timestamp'] = timestamp;
    return data;
  }

}

class DisasterHistory {
  String? disasterType;
  String? title;
  String? time;

  DisasterHistory({
    this.disasterType,
    this.title,
    this.time,
  });

  DisasterHistory.fromJson(Map<String, dynamic> json) {
    disasterType = json['disasterType'];
    title = json['title'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disasterType'] = disasterType;
    data['title'] = title;
    data['time'] = time;
    return data;
  }
}