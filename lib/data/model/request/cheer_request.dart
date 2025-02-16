class CheerRequest {
  String? content;

  CheerRequest({
    this.content
  });

  CheerRequest.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    return data;
  }
}