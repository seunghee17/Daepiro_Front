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
        addresses!.add(Addresses.fromJson(v));
      });
    }
    disasterTypes = json['disasterTypes'].cast<String>();
    disasterTypes = json['fcmToken'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['realname'] = realname;
    data['nickname'] = nickname;
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    data['disasterTypes'] = disasterTypes;
    data['fcmToken'] = fcmToken;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    return data;
  }
}