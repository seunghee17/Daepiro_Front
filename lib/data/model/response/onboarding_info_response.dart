class OnboardingInfoResponse {
  int? code;
  String? message;
  Data? data;
  String? path;
  String? timestamp;

  OnboardingInfoResponse({this.code, this.message, this.data, this.path, this.timestamp});

  OnboardingInfoResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] =null;
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['path'] = this.path;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Data {

Data.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
return data;
}
}