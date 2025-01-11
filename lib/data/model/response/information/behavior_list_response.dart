class BehaviorListResponse {
  int? code;
  String? message;
  List<Behavior>? data;
  String? path;
  String? timestamp;

  BehaviorListResponse({
    this.code,
    this.message,
    this.data,
    this.path,
    this.timestamp
  });

  BehaviorListResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Behavior>[];
      json['data'].forEach((v) {
        data!.add(Behavior.fromJson(v));
      });
    }
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Behavior {
  int? id;
  String? name;
  List<Tips>? tips;

  Behavior({this.id, this.name, this.tips});

  Behavior.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['tips'] != null) {
      tips = <Tips>[];
      json['tips'].forEach((v) {
        tips!.add(Tips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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
