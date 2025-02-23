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
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['path'] = path;
    data['timestamp'] = timestamp;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nextCursor'] = nextCursor;
    if (contents != null) {
      data['contents'] = contents!.map((item) => item.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['thumbnailUrl'] = thumbnailUrl;
    data['bodyUrl'] = bodyUrl;
    data['source'] = source;
    data['publishedAt'] = publishedAt;
    data['viewCount'] = viewCount;
    data['likeCount'] = likeCount;
    return data;
  }
}