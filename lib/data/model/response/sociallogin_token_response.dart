class SocialLoginTokenResponse {
  String accessToken = "";
  String refreshToken = "";
  bool isOnboarding = false;

  SocialLoginTokenResponse(
      {required this.accessToken, required this.refreshToken, required this.isOnboarding});

  SocialLoginTokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    isOnboarding = json['isOnboarding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['isOnboarding'] = this.isOnboarding;
    return data;
  }
}