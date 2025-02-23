class CommunityDisasterEditRequest {
  String? body;

  CommunityDisasterEditRequest({this.body});

  CommunityDisasterEditRequest.fromJson(Map<String, dynamic> json) {
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = body;
    return data;
  }
}