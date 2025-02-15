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

class DisastersData {
  String? region;
  List<Disasters>? disasters;

  DisastersData({this.region, this.disasters});

  DisastersData.fromJson(Map<String, dynamic> json) {
    region = json['region'];
    if (json['disasters'] != null) {
      disasters = <Disasters>[];
      json['disasters'].forEach((v) {
        disasters!.add(new Disasters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['region'] = this.region;
    if (this.disasters != null) {
      data['disasters'] = this.disasters!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['disasterType'] = this.disasterType;
    data['disasterTypeId'] = this.disasterTypeId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['time'] = this.time;
    return data;
  }
}
