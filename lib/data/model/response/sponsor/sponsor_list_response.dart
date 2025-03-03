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
  String? sponsorPostUrl;
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
    this.sponsorPostUrl,
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
    sponsorPostUrl = json['sponsorPostUrl'];
    summary = json['summary'].cast<String>();
    body = json['body'];
    disasterType = json['disasterType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['deadline'] = deadline;
    data['sponsorName'] = sponsorName;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['thumbnail'] = thumbnail;
    data['currentHeart'] = currentHeart;
    data['targetHeart'] = targetHeart;
    data['sponsorDescription'] = sponsorDescription;
    data['sponsorUrl'] = sponsorUrl;
    data['sponsorPostUrl'] = sponsorPostUrl;
    data['summary'] = summary;
    data['body'] = body;
    data['disasterType'] = disasterType;
    return data;
  }
}