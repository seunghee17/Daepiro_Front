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

  Reply(
      {this.id,
        this.name,
        this.time,
        this.content,
        this.likeCount,
        this.isMine});

  Reply.fromJson(Map<String, dynamic> json) {
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