class CommunityReplyReportRequest {
  String? detail;
  String? type;
  String? email;

  CommunityReplyReportRequest({this.detail, this.type, this.email});

  CommunityReplyReportRequest.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    type = json['type'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    data['type'] = this.type;
    data['email'] = this.email;
    return data;
  }
}