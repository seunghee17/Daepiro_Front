class SetFcmRequest {
  String? fcmToken;

  SetFcmRequest({this.fcmToken});

  SetFcmRequest.fromJson(Map<String, dynamic> json) {
    fcmToken = json['fcmToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fcmToken'] = this.fcmToken;
    return data;
  }
}