class CommunityDisasterEditResponse {
  int? code;
  String? message;
  EditData? data;
  String? path;
  String? timestamp;

  CommunityDisasterEditResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  CommunityDisasterEditResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? EditData.fromJson(json['data']) : null;
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

class EditData {
  EditData();

  EditData.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
