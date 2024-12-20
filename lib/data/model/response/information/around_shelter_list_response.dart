class AroundShelterListResponse {
  int? code;
  String? message;
  Data? data;
  String? path;
  String? timestamp;

  AroundShelterListResponse({
    this.code,
    this.message,
    this.data,
    this.path,
    this.timestamp
  });

  AroundShelterListResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['path'] = this.path;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Data {
  String? myLocation;
  List<Shelters>? shelters;

  Data({
    this.myLocation,
    this.shelters
  });

  Data.fromJson(Map<String, dynamic> json) {
    myLocation = json['myLocation'];
    if (json['shelters'] != null) {
      shelters = <Shelters>[];
      json['shelters'].forEach((v) {
        shelters!.add(Shelters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['myLocation'] = this.myLocation;
    if (this.shelters != null) {
      data['shelters'] = this.shelters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shelters {
  String? name;
  int? distance;
  String? address;
  double? longitude;
  double? latitude;

  Shelters(
      {this.name, this.distance, this.address, this.longitude, this.latitude});

  Shelters.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    distance = json['distance'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['distance'] = this.distance;
    data['address'] = this.address;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}
