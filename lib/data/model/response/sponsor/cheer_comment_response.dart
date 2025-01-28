
class CheerCommentResponse {
  int? code;
  String? message;
  List<Comment>? data;
  String? path;
  String? timestamp;

  CheerCommentResponse({
    this.code,
    this.message,
    this.data,
    this.path,
    this.timestamp
  });

  CheerCommentResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Comment>[];
      json['data'].forEach((v) { data!.add(Comment.fromJson(v)); });
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

class Comment {
  int? id;
  String? content;
  String? author;
  String? time;
  bool? isModified;
  bool? isMine;

  Comment({
    this.id,
    this.content,
    this.author,
    this.time,
    this.isModified,
    this.isMine,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    author = json['author'];
    time = json['time'];
    isModified = json['isModified'];
    isMine = json['isMine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['author'] = this.author;
    data['time'] = this.time;
    data['isModified'] = this.isModified;
    data['isMine'] = this.isMine;
    return data;
  }
}