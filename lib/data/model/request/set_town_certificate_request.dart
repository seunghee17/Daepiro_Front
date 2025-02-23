class SetTownCertificateRequest {
  String? address;
  double? longitude;
  double? latitude;

  SetTownCertificateRequest({this.address, this.longitude, this.latitude});

  SetTownCertificateRequest.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}