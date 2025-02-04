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
    data = json['data'] != null ? new LikeData.fromJson(json['data']) : null;
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

class LikeData {
  int? id;
  int? likeCount;

  LikeData({this.id, this.likeCount});

  LikeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    likeCount = json['likeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['likeCount'] = this.likeCount;
    return data;
  }
}