class CommunityDongnaeContentResponse {
  int? code;
  String? message;
  Article? data;
  String? path;
  String? timestamp;

  CommunityDongnaeContentResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  CommunityDongnaeContentResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Article.fromJson(json['data']) : null;
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

class Article {
  List<Content>? content;
  Pageable? pageable;
  int? size;
  int? number;
  List<dynamic>? sort;
  int? numberOfElements;
  bool? first;
  bool? last;
  bool? empty;

  Article(
      {this.content,
        this.pageable,
        this.size,
        this.number,
        this.sort,
        this.numberOfElements,
        this.first,
        this.last,
        this.empty});

  Article.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? Pageable.fromJson(json['pageable'])
        : null;
    size = json['size'];
    number = json['number'];
    sort = json['sort'];
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    last = json['last'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    data['size'] = size;
    data['number'] = number;
    if (sort != null) {
      data['sort'] = sort!.map((v) => v.toJson()).toList();
    }
    data['numberOfElements'] = numberOfElements;
    data['first'] = first;
    data['last'] = last;
    data['empty'] = empty;
    return data;
  }
}

class Content {
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
  String? previewImageUrl;
  bool? isLiked;

  Content(
      {this.id,
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
        this.previewImageUrl,
        this.isLiked});

  Content.fromJson(Map<String, dynamic> json) {
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
    data['previewImageUrl'] = previewImageUrl ?? '';
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
  bool? isVerified;

  AuthorUser(
      {this.userId,
        this.nickname,
        this.realname,
        this.isCompletedOnboarding,
        this.isVerified});

  AuthorUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nickname = json['nickname'];
    realname = json['realname'];
    isCompletedOnboarding = json['isCompletedOnboarding'];
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['nickname'] = nickname;
    data['realname'] = realname;
    data['isCompletedOnboarding'] = isCompletedOnboarding;
    data['isVerified'] = isVerified;
    return data;
  }
}

class Pageable {
  int? pageNumber;
  int? pageSize;
  List<dynamic>? sort;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.pageNumber,
        this.pageSize,
        this.sort,
        this.offset,
        this.paged,
        this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    sort = json['sort'];
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    if (sort != null) {
      data['sort'] = sort!.map((v) => v.toJson()).toList();
    }
    data['offset'] = offset;
    data['paged'] = paged;
    data['unpaged'] = unpaged;
    return data;
  }
}