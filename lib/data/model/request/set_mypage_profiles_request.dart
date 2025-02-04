class SetMyPageProfilesRequest {
  String? realname;
  String? nickname;

  SetMyPageProfilesRequest({this.realname, this.nickname});

  SetMyPageProfilesRequest.fromJson(Map<String, dynamic> json) {
    realname = json['realname'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['realname'] = this.realname;
    data['nickname'] = this.nickname;
    return data;
  }
}