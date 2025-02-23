class RegisterUserLocationRequest {
  String? longitude;
  String? latitude;

  RegisterUserLocationRequest({
    this.longitude,
    this.latitude
  });

  RegisterUserLocationRequest.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}