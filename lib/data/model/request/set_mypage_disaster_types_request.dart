class SetMypageDisasterTypesRequest {
  List<String>? disasterTypes;

  SetMypageDisasterTypesRequest({this.disasterTypes});

  SetMypageDisasterTypesRequest.fromJson(Map<String, dynamic> json) {
    disasterTypes = json['disasterTypes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disasterTypes'] = disasterTypes;
    return data;
  }
}