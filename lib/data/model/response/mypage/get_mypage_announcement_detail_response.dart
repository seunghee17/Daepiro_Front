class AnnouncementDetailResponse {
  int? code;
  String? message;
  AnnounceMentDetail? data;
  String? path;
  String? timestamp;

  AnnouncementDetailResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  AnnouncementDetailResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new AnnounceMentDetail.fromJson(json['data']) : null;
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

class AnnounceMentDetail {
  int? id;
  String? title;
  String? body;
  String? createdAt;
  List<Next>? next;

  AnnounceMentDetail({this.id, this.title, this.body, this.createdAt, this.next});

  AnnounceMentDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    createdAt = json['createdAt'];
    if (json['next'] != null) {
      next = <Next>[];
      json['next'].forEach((v) {
        next!.add(new Next.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['createdAt'] = this.createdAt;
    if (this.next != null) {
      data['next'] = this.next!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Next {
  int? id;
  String? title;
  String? body;
  String? createdAt;

  Next({this.id, this.title, this.body, this.createdAt});

  Next.fromJson(Map<String, dynamic> json) {
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