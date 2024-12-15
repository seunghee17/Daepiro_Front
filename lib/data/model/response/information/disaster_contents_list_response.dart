class DisasterContentsListResponse {
  int? code;
  String? message;
  Data? data;
  String? path;
  String? timestamp;

  DisasterContentsListResponse(
      this.code,
      this.message,
      this.data,
      this.path,
      this.timestamp
  );

  DisasterContentsListResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int? nextCursor;
  List<Contents>? contents;

  Data({
    this.contents,
    this.nextCursor
  });

  Data.fromJson(Map<String, dynamic> json) {
    nextCursor = json['nextCursor'];
    if (json['contents'] != null) {
      contents = (json['contents'] as List)
          .map((item) => Contents.fromJson(item))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nextCursor'] = this.nextCursor;
    if (this.contents != null) {
      data['contents'] = this.contents!.map((item) => item.toJson()).toList();
    }
    return data;
  }
}

class Contents {
  String? title;
  String? thumbnailUrl;
  String? bodyUrl;
  String? source;
  String? publishedAt;
  int? viewCount;
  int? likeCount;

  Contents(
      this.title,
      this.thumbnailUrl,
      this.bodyUrl,
      this.source,
      this.publishedAt,
      this.viewCount,
      this.likeCount
    );

  Contents.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumbnailUrl = json['thumbnailUrl'];
    bodyUrl = json['bodyUrl'];
    source = json['source'];
    publishedAt = json['publishedAt'];
    viewCount = json['viewCount'];
    likeCount = json['likeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['bodyUrl'] = this.bodyUrl;
    data['source'] = this.source;
    data['publishedAt'] = this.publishedAt;
    data['viewCount'] = this.viewCount;
    data['likeCount'] = this.likeCount;
    return data;
  }
}