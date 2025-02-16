class PopularPostResponse {
  int? code;
  String? message;
  List<PopularPost>? data;
  String? path;
  String? timestamp;

  PopularPostResponse({
    this.code,
    this.message,
    this.data,
    this.path,
    this.timestamp
  });

  PopularPostResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PopularPost>[];
      json['data'].forEach((v) {
        data!.add(PopularPost.fromJson(v));
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

class PopularPost {
  int? id;
  String? status;
  String? type;
  String? category;
  String? title;
  String? body;
  int? likeCount;
  int? viewCount;
  int? commentCount;
  int? reportCount;
  Address? address;
  String? createdAt;
  String? lastModifiedAt;
  AuthorUser? authorUser;
  bool? isMine;
  String? previewImageUrl;
  bool? isLiked;

  PopularPost({
    this.id,
    this.status,
    this.type,
    this.category,
    this.title,
    this.body,
    this.likeCount,
    this.viewCount,
    this.commentCount,
    this.reportCount,
    this.address,
    this.createdAt,
    this.lastModifiedAt,
    this.authorUser,
    this.isMine,
    this.previewImageUrl,
    this.isLiked
  });

  PopularPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    type = json['type'];
    category = json['category'];
    title = json['title'];
    body = json['body'];
    likeCount = json['likeCount'];
    viewCount = json['viewCount'];
    commentCount = json['commentCount'];
    reportCount = json['reportCount'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    createdAt = json['createdAt'];
    lastModifiedAt = json['lastModifiedAt'];
    authorUser = json['authorUser'] != null
        ? AuthorUser.fromJson(json['authorUser'])
        : null;
    isMine = json['isMine'];
    previewImageUrl = json['previewImageUrl'];
    isLiked = json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['type'] = type;
    data['category'] = category;
    data['title'] = title;
    data['body'] = body;
    data['likeCount'] = likeCount;
    data['viewCount'] = viewCount;
    data['commentCount'] = commentCount;
    data['reportCount'] = reportCount;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['createdAt'] = createdAt;
    data['lastModifiedAt'] = lastModifiedAt;
    if (authorUser != null) {
      data['authorUser'] = authorUser!.toJson();
    }
    data['isMine'] = isMine;
    data['previewImageUrl'] = previewImageUrl;
    data['isLiked'] = isLiked;
    return data;
  }
}

class Address {
  int? addressId;
  String? siDo;
  String? siGunGu;

  Address({this.addressId, this.siDo, this.siGunGu});

  Address.fromJson(Map<String, dynamic> json) {
    addressId = json['addressId'];
    siDo = json['siDo'];
    siGunGu = json['siGunGu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressId'] = addressId;
    data['siDo'] = siDo;
    data['siGunGu'] = siGunGu;
    return data;
  }
}

class AuthorUser {
  int? userId;
  String? nickname;
  String? realname;
  bool? isCompletedOnboarding;
  String? profileImageUrl;
  bool? isVerified;

  AuthorUser({
    this.userId,
    this.nickname,
    this.realname,
    this.isCompletedOnboarding,
    this.profileImageUrl,
    this.isVerified
  });

  AuthorUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nickname = json['nickname'];
    realname = json['realname'];
    isCompletedOnboarding = json['isCompletedOnboarding'];
    profileImageUrl = json['profileImageUrl'];
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['nickname'] = nickname;
    data['realname'] = realname;
    data['isCompletedOnboarding'] = isCompletedOnboarding;
    data['profileImageUrl'] = profileImageUrl;
    data['isVerified'] = isVerified;
    return data;
  }
}
