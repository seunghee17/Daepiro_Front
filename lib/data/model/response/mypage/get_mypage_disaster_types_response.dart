class GetMyPageDisasterTypesResponse {
  int? code;
  String? message;
  DisasterTypes? data;
  String? path;
  String? timestamp;

  GetMyPageDisasterTypesResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  GetMyPageDisasterTypesResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? DisasterTypes.fromJson(json['data']) : null;
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

class DisasterTypes {
  List<String>? disasterTypes;

  DisasterTypes({this.disasterTypes});

  DisasterTypes.fromJson(Map<String, dynamic> json) {
    disasterTypes = json['disasterTypes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disasterTypes'] = disasterTypes;
    return data;
  }
}