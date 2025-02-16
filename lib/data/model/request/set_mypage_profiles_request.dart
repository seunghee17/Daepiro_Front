class SetMyPageProfilesRequest {
  String? realname;
  String? nickname;

  SetMyPageProfilesRequest({this.realname, this.nickname});

  SetMyPageProfilesRequest.fromJson(Map<String, dynamic> json) {
    realname = json['realname'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['realname'] = realname;
    data['nickname'] = nickname;
    return data;
  }
}