class CommunityReplyLikeResponse {
  int? code;
  String? message;
  LikeData? data;
  String? path;
  String? timestamp;

  CommunityReplyLikeResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  CommunityReplyLikeResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? LikeData.fromJson(json['data']) : null;
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

class LikeData {
  int? id;
  int? likeCount;

  LikeData({this.id, this.likeCount});

  LikeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    likeCount = json['likeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['likeCount'] = likeCount;
    return data;
  }
}