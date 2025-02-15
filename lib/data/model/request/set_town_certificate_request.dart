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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}