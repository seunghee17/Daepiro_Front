class NotificationResponse {
  int? code;
  String? message;
  List<Notification>? data;
  String? path;
  String? timestamp;

  NotificationResponse({this.code, this.message, this.data, this.path, this.timestamp});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Notification>[];
      json['data'].forEach((v) {
        data!.add(Notification.fromJson(v));
      });
    }
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Notification {
  String? category;
  String? title;
  String? body;
  String? createdAt;

  Notification({this.category, this.title, this.body, this.createdAt});

  Notification.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    title = json['title'];
    body = json['body'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['category'] = this.category;
    data['title'] = this.title;
    data['body'] = this.body;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
