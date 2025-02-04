class GetMyPageProfilesResponse {
  int? code;
  String? message;
  Profiles? data;
  String? path;
  String? timestamp;

  GetMyPageProfilesResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  GetMyPageProfilesResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Profiles.fromJson(json['data']) : null;
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

class Profiles {
  String? profileImgUrl;
  String? realname;
  String? nickname;

  Profiles({this.profileImgUrl, this.realname, this.nickname});

  Profiles.fromJson(Map<String, dynamic> json) {
    profileImgUrl = json['profileImgUrl'];
    realname = json['realname'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profileImgUrl'] = this.profileImgUrl;
    data['realname'] = this.realname;
    data['nickname'] = this.nickname;
    return data;
  }
}