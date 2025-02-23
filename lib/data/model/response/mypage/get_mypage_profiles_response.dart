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
    data = json['data'] != null ? Profiles.fromJson(json['data']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profileImgUrl'] = profileImgUrl;
    data['realname'] = realname;
    data['nickname'] = nickname;
    return data;
  }
}