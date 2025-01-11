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
    data = json['data'] != null ? new Article.fromJson(json['data']) : null;
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
        content!.add(new Content.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['size'] = this.size;
    data['number'] = this.number;
    if (this.sort != null) {
      data['sort'] = this.sort!.map((v) => v.toJson()).toList();
    }
    data['numberOfElements'] = this.numberOfElements;
    data['first'] = this.first;
    data['last'] = this.last;
    data['empty'] = this.empty;
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
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    createdAt = json['createdAt'];
    lastModifiedAt = json['lastModifiedAt'];
    authorUser = json['authorUser'] != null
        ? new AuthorUser.fromJson(json['authorUser'])
        : null;
    previewImageUrl = json['previewImageUrl'];
    isLiked = json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['type'] = this.type;
    data['category'] = this.category;
    data['title'] = this.title;
    data['body'] = this.body;
    data['likeCount'] = this.likeCount;
    data['viewCount'] = this.viewCount;
    data['commentCount'] = this.commentCount;
    data['reportCount'] = this.reportCount;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['lastModifiedAt'] = this.lastModifiedAt;
    if (this.authorUser != null) {
      data['authorUser'] = this.authorUser!.toJson();
    }
    data['previewImageUrl'] = this.previewImageUrl ?? '';
    data['isLiked'] = this.isLiked;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressId'] = this.addressId;
    data['siDo'] = this.siDo;
    data['siGunGu'] = this.siGunGu;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    data['realname'] = this.realname;
    data['isCompletedOnboarding'] = this.isCompletedOnboarding;
    data['isVerified'] = this.isVerified;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    if (this.sort != null) {
      data['sort'] = this.sort!.map((v) => v.toJson()).toList();
    }
    data['offset'] = this.offset;
    data['paged'] = this.paged;
    data['unpaged'] = this.unpaged;
    return data;
  }
}