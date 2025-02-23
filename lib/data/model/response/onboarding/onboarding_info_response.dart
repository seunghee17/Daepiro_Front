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
        data!.add(Adress.fromJson(v));
      });
    }
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['timestamp'] = timestamp;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressId'] = addressId;
    data['fullAddress'] = fullAddress;
    data['shortAddress'] = shortAddress;
    return data;
  }
}