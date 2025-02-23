class UserAddressResponse {
  int? code;
  String? message;
  List<StoreAdress>? data;
  String? path;
  String? timestamp;

  UserAddressResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  UserAddressResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StoreAdress>[];
      json['data'].forEach((v) {
        data!.add(StoreAdress.fromJson(v));
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

class StoreAdress {
  int? addressId;
  String? fullAddress;
  String? shortAddress;

  StoreAdress({this.addressId, this.fullAddress, this.shortAddress});

  StoreAdress.fromJson(Map<String, dynamic> json) {
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