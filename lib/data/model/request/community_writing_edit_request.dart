class CommunityWritingEditRequest {
  String? articleType;
  String? articleCategory;
  bool? visibility;
  String? title;
  String? body;

  CommunityWritingEditRequest(
      {this.articleType, this.articleCategory, this.visibility, this.title, this.body});

  CommunityWritingEditRequest.fromJson(Map<String, dynamic> json) {
    articleType = json['articleType'];
    articleCategory = json['articleCategory'];
    visibility = json['visibility'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['articleType'] = articleType;
    data['articleCategory'] = articleCategory;
    data['visibility'] = visibility;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}