class OnboardingInfoResponse {
  int? code;
  String? message;
  List<Adress>? data;
  String? path;
  String? timestamp;

  OnboardingInfoResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  OnboardingInfoResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Adress>[];
      json['data'].forEach((v) {
        data!.add(new Adress.fromJson(v));
      });
    }
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Adress {
  int? addressId;
  String? fullAddress;
  String? shortAddress;

  Adress({this.addressId, this.fullAddress, this.shortAddress});

  Adress.fromJson(Map<String, dynamic> json) {
    addressId = json['addressId'];
    fullAddress = json['fullAddress'];
    shortAddress = json['shortAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressId'] = this.addressId;
    data['fullAddress'] = this.fullAddress;
    data['shortAddress'] = this.shortAddress;
    return data;
  }
}