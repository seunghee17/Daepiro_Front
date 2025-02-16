class SetFcmRequest {
  String? fcmToken;

  SetFcmRequest({this.fcmToken});

  SetFcmRequest.fromJson(Map<String, dynamic> json) {
    fcmToken = json['fcmToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fcmToken'] = fcmToken;
    return data;
  }
}