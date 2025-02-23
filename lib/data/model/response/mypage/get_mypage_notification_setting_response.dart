class GetMyPageNotificationSettingResponse {
  int? code;
  String? message;
  Notifications? data;
  String? path;
  String? timestamp;

  GetMyPageNotificationSettingResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  GetMyPageNotificationSettingResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Notifications.fromJson(json['data']) : null;
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

class Notifications {
  bool? isCommunityNotificationEnabled;
  bool? isDisasterNotificationEnabled;

  Notifications(
      {this.isCommunityNotificationEnabled,
        this.isDisasterNotificationEnabled});

  Notifications.fromJson(Map<String, dynamic> json) {
    isCommunityNotificationEnabled = json['isCommunityNotificationEnabled'];
    isDisasterNotificationEnabled = json['isDisasterNotificationEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isCommunityNotificationEnabled'] =
        isCommunityNotificationEnabled;
    data['isDisasterNotificationEnabled'] = isDisasterNotificationEnabled;
    return data;
  }
}