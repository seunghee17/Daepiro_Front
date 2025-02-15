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
        data!.add(new TownInfo.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressId'] = this.addressId;
    data['fullAddress'] = this.fullAddress;
    data['isVerified'] = this.isVerified;
    return data;
  }
}