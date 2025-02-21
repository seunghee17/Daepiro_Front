class WithDrawRequest {
  String? appleCode;

  WithDrawRequest({this.appleCode});

  WithDrawRequest.fromJson(Map<String, dynamic> json) {
    appleCode = json['appleCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appleCode'] = this.appleCode;
    return data;
  }
}