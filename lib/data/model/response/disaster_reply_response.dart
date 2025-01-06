class DisasterReplyResponse {
  int? code;
  String? message;
  List<Reply>? data;
  String? path;
  String? timestamp;

  DisasterReplyResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  DisasterReplyResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Reply>[];
      json['data'].forEach((v) {
        data!.add(new Reply.fromJson(v));
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

class Reply {
  int? id;
  String? name;
  String? time;
  String? content;
  int? likeCount;
  bool? isMine;
  bool? isDeleted;
  bool? isModified;
  bool? isVerified;
  List<ChildComments>? childComments;

  Reply(
      {this.id,
        this.name,
        this.time,
        this.content,
        this.likeCount,
        this.isMine,
        this.isDeleted,
        this.isModified,
        this.isVerified,
        this.childComments});

  Reply.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    content = json['content'];
    likeCount = json['likeCount'];
    isMine = json['isMine'];
    isDeleted = json['isDeleted'];
    isModified = json['isModified'];
    isVerified = json['isVerified'];
    if (json['childComments'] != null) {
      childComments = <ChildComments>[];
      json['childComments'].forEach((v) {
        childComments!.add(new ChildComments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['time'] = this.time;
    data['content'] = this.content;
    data['likeCount'] = this.likeCount;
    data['isMine'] = this.isMine;
    data['isDeleted'] = this.isDeleted;
    data['isModified'] = this.isModified;
    data['isVerified'] = this.isVerified;
    if (this.childComments != null) {
      data['childComments'] =
          this.childComments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildComments {
  int? id;
  String? name;
  String? time;
  String? content;
  int? likeCount;
  bool? isMine;
  bool? isDeleted;
  bool? isModified;
  bool? isVerified;

  ChildComments(
      {this.id,
        this.name,
        this.time,
        this.content,
        this.likeCount,
        this.isMine,
        this.isDeleted,
        this.isModified,
        this.isVerified,
      });

  ChildComments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    content = json['content'];
    likeCount = json['likeCount'];
    isMine = json['isMine'];
    isDeleted = json['isDeleted'];
    isModified = json['isModified'];
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['time'] = this.time;
    data['content'] = this.content;
    data['likeCount'] = this.likeCount;
    data['isMine'] = this.isMine;
    data['isDeleted'] = this.isDeleted;
    data['isModified'] = this.isModified;
    data['isVerified'] = this.isVerified;
    return data;
  }
}