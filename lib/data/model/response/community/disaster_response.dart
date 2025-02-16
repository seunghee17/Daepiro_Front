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
        data!.add(Disaster.fromJson(v));
      });
    }
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['timestamp'] = timestamp;
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
        comments!.add(Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['content'] = content;
    data['location'] = location;
    data['time'] = time;
    data['commentCount'] = commentCount;
    data['isReceived'] = isReceived;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['time'] = time;
    data['content'] = content;
    data['likeCount'] = likeCount;
    data['isMine'] = isMine;
    return data;
  }
}