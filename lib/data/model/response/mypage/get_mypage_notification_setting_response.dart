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
    data = json['data'] != null ? new Notifications.fromJson(json['data']) : null;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isCommunityNotificationEnabled'] =
        this.isCommunityNotificationEnabled;
    data['isDisasterNotificationEnabled'] = this.isDisasterNotificationEnabled;
    return data;
  }
}