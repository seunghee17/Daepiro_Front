import '../information/behavior_list_response.dart';

class BehaviorTipsResponse {
  int? code;
  String? message;
  BehaviorData? data;
  String? path;
  String? timestamp;

  BehaviorTipsResponse({
    this.code,
    this.message,
    this.data,
    this.path,
    this.timestamp
  });

  BehaviorTipsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new BehaviorData.fromJson(json['data']) : null;
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

class BehaviorData {
  String? disasterType;
  List<Tips>? tips;

  BehaviorData({this.disasterType, this.tips});

  BehaviorData.fromJson(Map<String, dynamic> json) {
    disasterType = json['id'];
    if (json['tips'] != null) {
      tips = <Tips>[];
      json['tips'].forEach((v) {
        tips!.add(Tips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['disasterType'] = this.disasterType;
    if (this.tips != null) {
      data['tips'] = this.tips!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tips {
  String? filter;
  List<String>? tips;

  Tips({this.filter, this.tips});

  Tips.fromJson(Map<String, dynamic> json) {
    filter = json['filter'];
    tips = json['tips'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['filter'] = this.filter;
    data['tips'] = this.tips;
    return data;
  }
}
