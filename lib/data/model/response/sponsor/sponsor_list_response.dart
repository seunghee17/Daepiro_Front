class SponsorListResponse {
  int? code;
  String? message;
  List<Sponsor>? data;
  String? path;
  String? timestamp;

  SponsorListResponse({
    this.code,
    this.message,
    this.data,
    this.path,
    this.timestamp
  });

  SponsorListResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Sponsor>[];
      json['data'].forEach((v) { data!.add(Sponsor.fromJson(v)); });
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

class Sponsor {
  int? id;
  String? deadline;
  String? sponsorName;
  String? title;
  String? subtitle;
  String? thumbnail;
  int? currentHeart;
  int? targetHeart;
  String? sponsorDescription;
  String? sponsorUrl;
  List<String>? summary;
  String? body;
  String? disasterType;

  Sponsor({
    this.id,
    this.deadline,
    this.sponsorName,
    this.title,
    this.subtitle,
    this.thumbnail,
    this.currentHeart,
    this.targetHeart,
    this.sponsorDescription,
    this.sponsorUrl,
    this.summary,
    this.body,
    this.disasterType
  });

  Sponsor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deadline = json['deadline'];
    sponsorName = json['sponsorName'];
    title = json['title'];
    subtitle = json['subtitle'];
    thumbnail = json['thumbnail'];
    currentHeart = json['currentHeart'];
    targetHeart = json['targetHeart'];
    sponsorDescription = json['sponsorDescription'];
    sponsorUrl = json['sponsorUrl'];
    summary = json['summary'].cast<String>();
    body = json['body'];
    disasterType = json['disasterType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['deadline'] = this.deadline;
    data['sponsorName'] = this.sponsorName;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['thumbnail'] = this.thumbnail;
    data['currentHeart'] = this.currentHeart;
    data['targetHeart'] = this.targetHeart;
    data['sponsorDescription'] = this.sponsorDescription;
    data['sponsorUrl'] = this.sponsorUrl;
    data['summary'] = this.summary;
    data['body'] = this.body;
    data['disasterType'] = this.disasterType;
    return data;
  }
}