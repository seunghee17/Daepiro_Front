// class HomeResponse {
//   int? code;
//   String? message;
//   Data? data;
//   String? path;
//   String? timestamp;
//
//   HomeResponse(
//       this.code,
//       this.message,
//       this.data,
//       this.path,
//       this.timestamp
//   )
//
//   HomeResponse.fromJson()
//
// }
//
// class NicknameCheckResponse {
//   int? code;
//   String? message;
//   Data? data;
//   String? path;
//   String? timestamp;
//
//   NicknameCheckResponse(
//       {this.code, this.message, this.data, this.path, this.timestamp});
//
//   NicknameCheckResponse.fromJson(Map<String, dynamic> json) {
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
//   bool? isAvailable;
//
//   Data({this.isAvailable});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     isAvailable = json['isAvailable'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['isAvailable'] = this.isAvailable;
//     return data;
//   }
// }