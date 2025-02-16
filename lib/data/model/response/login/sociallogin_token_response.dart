class SocialLoginTokenResponse {
  int? code;
  String? message;
  Data? data;
  String? path;
  String? timestamp;

  SocialLoginTokenResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  SocialLoginTokenResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  String? accessToken;
  String? refreshToken;
  bool? isCompletedOnboarding;

  Data({this.accessToken, this.refreshToken, this.isCompletedOnboarding});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    isCompletedOnboarding = json['isCompletedOnboarding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['isCompletedOnboarding'] = isCompletedOnboarding;
    return data;
  }
}