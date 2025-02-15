// class CommunityTownLikeResponse {
//   int? code;
//   String? message;
//   Data? data;
//   String? path;
//   String? timestamp;
//
//   CommunityTownLikeResponse(
//       {this.code, this.message, this.data, this.path, this.timestamp});
//
//   CommunityTownLikeResponse.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     path = json['path'];
//     timestamp = json['timestamp'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['path'] = this.path;
//     data['timestamp'] = this.timestamp;
//     return data;
//   }
// }
//
// class Data {
//   int? articleId;
//   int? likeCount;
//
//   Data({this.articleId, this.likeCount});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     articleId = json['articleId'];
//     likeCount = json['likeCount'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['articleId'] = this.articleId;
//     data['likeCount'] = this.likeCount;
//     return data;
//   }
// }