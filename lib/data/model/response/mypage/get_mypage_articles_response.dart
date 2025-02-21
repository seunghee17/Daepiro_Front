class GetMyPageArticlesResponse {
  int? code;
  String? message;
  Articles? data;
  String? path;
  String? timestamp;

  GetMyPageArticlesResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  GetMyPageArticlesResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Articles.fromJson(json['data']) : null;
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

class Articles {
  int? size;
  List<UserArticle>? content;
  int? number;
  List<dynamic>? sort;
  int? numberOfElements;
  Pageable? pageable;
  bool? first;
  bool? last;
  bool? empty;

  Articles(
      {this.size,
        this.content,
        this.number,
        this.sort,
        this.numberOfElements,
        this.pageable,
        this.first,
        this.last,
        this.empty});

  Articles.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    if (json['content'] != null) {
      content = <UserArticle>[];
      json['content'].forEach((v) {
        content!.add(new UserArticle.fromJson(v));
      });
    }
    number = json['number'];
    sort = json['sort'];
    numberOfElements = json['numberOfElements'];
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    first = json['first'];
    last = json['last'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['number'] = this.number;
    if (this.sort != null) {
      data['sort'] = this.sort!.map((v) => v.toJson()).toList();
    }
    data['numberOfElements'] = this.numberOfElements;
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['first'] = this.first;
    data['last'] = this.last;
    data['empty'] = this.empty;
    return data;
  }
}

class UserArticle {
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

  UserArticle(
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
        this.isMine,
        this.previewImageUrl,
        this.isLiked});

  UserArticle.fromJson(Map<String, dynamic> json) {
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
    isMine = json['isMine'];
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
    data['isMine'] = this.isMine;
    data['previewImageUrl'] = this.previewImageUrl;
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
  String? profileImageUrl;
  bool? isVerified;

  AuthorUser(
      {this.userId,
        this.nickname,
        this.realname,
        this.isCompletedOnboarding,
        this.profileImageUrl,
        this.isVerified});

  AuthorUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nickname = json['nickname'];
    realname = json['realname'];
    isCompletedOnboarding = json['isCompletedOnboarding'];
    profileImageUrl = json['profileImageUrl'];
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    data['realname'] = this.realname;
    data['isCompletedOnboarding'] = this.isCompletedOnboarding;
    data['profileImageUrl'] = this.profileImageUrl;
    data['isVerified'] = this.isVerified;
    return data;
  }
}

class Pageable {
  int? offset;
  List<dynamic>? sort;
  bool? paged;
  int? pageNumber;
  int? pageSize;
  bool? unpaged;

  Pageable(
      {this.offset,
        this.sort,
        this.paged,
        this.pageNumber,
        this.pageSize,
        this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    sort = json['sort'];
    paged = json['paged'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    if (this.sort != null) {
      data['sort'] = this.sort!.map((v) => v.toJson()).toList();
    }
    data['paged'] = this.paged;
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['unpaged'] = this.unpaged;
    return data;
  }
}
