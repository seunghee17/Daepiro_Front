class DisastersHistoryResponse {
  int? code;
  String? message;
  List<DisastersData>? data;
  String? path;
  String? timestamp;

  DisastersHistoryResponse({this.code, this.message, this.data, this.path, this.timestamp});

  DisastersHistoryResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DisastersData>[];
      json['data'].forEach((v) {
        data!.add(DisastersData.fromJson(v));
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

class DisastersData {
  String? region;
  List<Disasters>? disasters;

  DisastersData({this.region, this.disasters});

  DisastersData.fromJson(Map<String, dynamic> json) {
    region = json['region'];
    if (json['disasters'] != null) {
      disasters = <Disasters>[];
      json['disasters'].forEach((v) {
        disasters!.add(Disasters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['region'] = region;
    if (disasters != null) {
      data['disasters'] = disasters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Disasters {
  String? disasterType;
  int? disasterTypeId;
  String? title;
  String? content;
  String? time;

  Disasters({this.disasterType, this.disasterTypeId, this.title, this.content, this.time});

  Disasters.fromJson(Map<String, dynamic> json) {
    disasterType = json['disasterType'];
    disasterTypeId = json['disasterTypeId'];
    title = json['title'];
    content = json['content'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disasterType'] = disasterType;
    data['disasterTypeId'] = disasterTypeId;
    data['title'] = title;
    data['content'] = content;
    data['time'] = time;
    return data;
  }
}
