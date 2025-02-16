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
    data = json['data'] != null ? Articles.fromJson(json['data']) : null;
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

class Articles {
  int? size;
  List<UserArticle>? content;
  int? number;
  Sort? sort;
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
        content!.add(UserArticle.fromJson(v));
      });
    }
    number = json['number'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    pageable = json['pageable'] != null
        ? Pageable.fromJson(json['pageable'])
        : null;
    first = json['first'];
    last = json['last'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    data['number'] = number;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['numberOfElements'] = numberOfElements;
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    data['first'] = first;
    data['last'] = last;
    data['empty'] = empty;
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

class Sort {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Sort({this.empty, this.sorted, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empty'] = empty;
    data['sorted'] = sorted;
    data['unsorted'] = unsorted;
    return data;
  }
}

class Pageable {
  int? offset;
  Sort? sort;
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
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    paged = json['paged'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['paged'] = paged;
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['unpaged'] = unpaged;
    return data;
  }
}
