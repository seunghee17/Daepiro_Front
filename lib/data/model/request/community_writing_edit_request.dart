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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['articleType'] = this.articleType;
    data['articleCategory'] = this.articleCategory;
    data['visibility'] = this.visibility;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}