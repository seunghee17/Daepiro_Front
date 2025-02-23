class HomeStatusResponse {
  int? code;
  String? message;
  Data? data;
  String? path;
  String? timestamp;

  HomeStatusResponse(
      this.code,
      this.message,
      this.data,
      this.path,
      this.timestamp
  );

  HomeStatusResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  bool? isOccurred;

  Data({this.isOccurred});

  Data.fromJson(Map<String, dynamic> json) {
    isOccurred = json['isOccurred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isOccurred'] = isOccurred;
    return data;
  }
}