
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
    data = json['data'] != null ? BehaviorData.fromJson(json['data']) : null;
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['path'] = path;
    data['timestamp'] = timestamp;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disasterType'] = disasterType;
    if (tips != null) {
      data['tips'] = tips!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  BehaviorData copyWith({String? disasterType, List<Tips>? tips}) {
    return BehaviorData(
      disasterType: disasterType ?? this.disasterType,
      tips: tips ?? this.tips,
    );
  }
}

class Tips {
  String? filter;
  List<(String, bool)>? tips;

  Tips({this.filter, this.tips});

  Tips.fromJson(Map<String, dynamic> json) {
    filter = json['filter'];
    tips = (json['tips'] as List<dynamic>?)
        ?.map((e) => (e as String, false))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['filter'] = filter;
    data['tips'] = tips?.map((e) => e.$1).toList();
    return data;
  }

  Tips copyWith({String? filter, List<(String, bool)>? tips}) {
    return Tips(
      filter: filter ?? this.filter,
      tips: tips ?? this.tips,
    );
  }
}
