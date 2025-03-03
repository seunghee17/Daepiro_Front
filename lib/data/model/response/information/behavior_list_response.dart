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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['timestamp'] = timestamp;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (tips != null) {
      data['tips'] = tips!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Behavior copyWith({int? id, String? name, List<Tips>? tips}) {
    return Behavior(
      id: id ?? this.id,
      name: name ?? this.name,
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
