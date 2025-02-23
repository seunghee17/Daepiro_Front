class AnnouncementListResponse {
  int? code;
  String? message;
  List<Announcements>? data;
  String? path;
  String? timestamp;

  AnnouncementListResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  AnnouncementListResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Announcements>[];
      json['data'].forEach((v) {
        data!.add(new Announcements.fromJson(v));
      });
    }
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

class Announcements {
  int? id;
  String? title;
  String? body;
  String? createdAt;

  Announcements({this.id, this.title, this.body, this.createdAt});

  Announcements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['createdAt'] = this.createdAt;
    return data;
  }
}