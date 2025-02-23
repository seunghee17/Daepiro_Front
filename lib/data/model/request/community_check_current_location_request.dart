class CommunityCheckCurrentLocationRequest {
  String? address;
  double? longitude;
  double? latitude;

  CommunityCheckCurrentLocationRequest(
      {this.address, this.longitude, this.latitude});

  CommunityCheckCurrentLocationRequest.fromJson(Map<String, dynamic> json) {
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