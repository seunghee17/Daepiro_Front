class TownCertificateResponse {
  int? code;
  String? message;
  List<TownInfo>? data;
  String? path;
  String? timestamp;

  TownCertificateResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  TownCertificateResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TownInfo>[];
      json['data'].forEach((v) {
        data!.add(TownInfo.fromJson(v));
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

class TownInfo {
  int? addressId;
  String? fullAddress;
  bool? isVerified;

  TownInfo({this.addressId, this.fullAddress, this.isVerified});

  TownInfo.fromJson(Map<String, dynamic> json) {
    addressId = json['addressId'];
    fullAddress = json['fullAddress'];
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressId'] = addressId;
    data['fullAddress'] = fullAddress;
    data['isVerified'] = isVerified;
    return data;
  }
}