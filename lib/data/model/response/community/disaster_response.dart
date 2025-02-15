class DisasterResponse {
  int? code;
  String? message;
  List<Disaster>? data;
  String? path;
  String? timestamp;

  DisasterResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  DisasterResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Disaster>[];
      json['data'].forEach((v) {
        data!.add(new Disaster.fromJson(v));
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

class Disaster {
  int? id;
  String? type;
  String? title;
  String? content;
  String? location;
  String? time;
  int? commentCount;
  bool? isReceived;
  List<Comments>? comments;

  Disaster(
      {this.id,
        this.type,
        this.title,
        this.content,
        this.location,
        this.time,
        this.commentCount,
        this.isReceived,
        this.comments});

  Disaster.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    content = json['content'];
    location = json['location'];
    time = json['time'];
    commentCount = json['commentCount'];
    isReceived = json['isReceived'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['title'] = this.title;
    data['content'] = this.content;
    data['location'] = this.location;
    data['time'] = this.time;
    data['commentCount'] = this.commentCount;
    data['isReceived'] = this.isReceived;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int? id;
  String? name;
  String? time;
  String? content;
  int? likeCount;
  bool? isMine;

  Comments(
      {this.id,
        this.name,
        this.time,
        this.content,
        this.likeCount,
        this.isMine});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    content = json['content'];
    likeCount = json['likeCount'];
    isMine = json['isMine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['time'] = this.time;
    data['content'] = this.content;
    data['likeCount'] = this.likeCount;
    data['isMine'] = this.isMine;
    return data;
  }
}