class SetMyPageInquiresRequest {
  String? type;
  String? content;
  String? email;

  SetMyPageInquiresRequest({this.type, this.content, this.email});

  SetMyPageInquiresRequest.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    content = json['content'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['content'] = this.content;
    data['email'] = this.email;
    return data;
  }
}