class OnboardingInfoRequest {
  String? realname;
  String? nickname;
  List<Addresses>? addresses;
  List<String>? disasterTypes;
  String? fcmToken;

  OnboardingInfoRequest(
      {this.realname, this.nickname, this.addresses, this.disasterTypes, this.fcmToken});

  OnboardingInfoRequest.fromJson(Map<String, dynamic> json) {
    realname = json['realname'];
    nickname = json['nickname'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
    disasterTypes = json['disasterTypes'].cast<String>();
    disasterTypes = json['fcmToken'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['realname'] = this.realname;
    data['nickname'] = this.nickname;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    data['disasterTypes'] = this.disasterTypes;
    data['fcmToken'] = this.fcmToken;
    return data;
  }
}

class Addresses {
  String? name;
  String? address;

  Addresses({this.name, this.address});

  Addresses.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    return data;
  }
}