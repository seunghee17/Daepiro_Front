import 'package:daepiro/data/model/response/sponsor/cheer_comment_response.dart';

class CheerKeywordResponse {
  int? code;
  String? message;
  List<Comment>? data;
  String? path;
  String? timestamp;

  CheerKeywordResponse({
    this.code,
    this.message,
    this.data,
    this.path,
    this.timestamp
  });

  CheerKeywordResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Comment>[];
      json['data'].forEach((v) { data!.add(Comment.fromJson(v)); });
    }
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['code'] = code;
      data['message'] = message;
      if (this.data != null) {
        data['data'] = this.data!.map((v) => v.toJson()).toList();
      }
      data['path'] = path;
      data['timestamp'] = timestamp;
      return data;
    }
}
