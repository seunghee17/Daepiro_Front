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
        data!.add(Reply.fromJson(v));
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
  bool? isLiked;

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
      this.childComments,
      this.isLiked});

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
        childComments!.add(ChildComments.fromJson(v));
      });
    }
    isLiked = json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['time'] = time;
    data['content'] = content;
    data['likeCount'] = likeCount;
    data['isMine'] = isMine;
    data['isDeleted'] = isDeleted;
    data['isModified'] = isModified;
    data['isVerified'] = isVerified;
    if (childComments != null) {
      data['childComments'] =
          childComments!.map((v) => v.toJson()).toList();
    }
    data['isLiked'] = isLiked;
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
  bool? isLiked;

  ChildComments({
    this.id,
    this.name,
    this.time,
    this.content,
    this.likeCount,
    this.isMine,
    this.isDeleted,
    this.isModified,
    this.isVerified,
    this.isLiked,
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
    isLiked = json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['time'] = time;
    data['content'] = content;
    data['likeCount'] = likeCount;
    data['isMine'] = isMine;
    data['isDeleted'] = isDeleted;
    data['isModified'] = isModified;
    data['isVerified'] = isVerified;
    data['isLiked'] = isLiked;
    return data;
  }
}
