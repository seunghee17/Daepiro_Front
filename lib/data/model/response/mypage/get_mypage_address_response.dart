class GetMyPageAddressResponse {
  int? code;
  String? message;
  Adresses? data;
  String? path;
  String? timestamp;

  GetMyPageAddressResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  GetMyPageAddressResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Adresses.fromJson(json['data']) : null;
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

class Adresses {
  List<Addresses>? addresses;

  Adresses({this.addresses});

  Adresses.fromJson(Map<String, dynamic> json) {
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  int? addressId;
  String? siDo;
  String? siGunGu;

  Addresses({this.addressId, this.siDo, this.siGunGu});

  Addresses.fromJson(Map<String, dynamic> json) {
    addressId = json['addressId'];
    siDo = json['siDo'];
    siGunGu = json['siGunGu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressId'] = addressId;
    data['siDo'] = siDo;
    data['siGunGu'] = siGunGu;
    return data;
  }
}