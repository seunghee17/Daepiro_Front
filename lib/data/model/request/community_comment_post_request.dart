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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = body;
    data['parentCommentId'] = parentCommentId;
    data['articleId'] = articleId;
    return data;
  }
}