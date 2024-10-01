class SocialLoginRequest {
  String? socialToken;

  SocialLoginRequest({this.socialToken});

  SocialLoginRequest.fromJson(Map<String, dynamic> json) {
    socialToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['socialToken'] = this.socialToken;
    return data;
  }
}