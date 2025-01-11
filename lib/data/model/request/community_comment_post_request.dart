class CommunityCommentPostRequest {
  String? body;
  int? parentCommentId;
  int? articleId;

  CommunityCommentPostRequest(
      {this.body, this.parentCommentId, this.articleId});

  CommunityCommentPostRequest.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    parentCommentId = json['parentCommentId'];
    articleId = json['articleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['parentCommentId'] = this.parentCommentId;
    data['articleId'] = this.articleId;
    return data;
  }
}