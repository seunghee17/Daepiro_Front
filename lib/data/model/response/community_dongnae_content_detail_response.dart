class CommunityDongNaeDetailContentResponse {
  int? code;
  String? message;
  ContentDetail? data;
  String? path;
  String? timestamp;

  CommunityDongNaeDetailContentResponse(
      {this.code, this.message, this.data, this.path, this.timestamp});

  CommunityDongNaeDetailContentResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new ContentDetail.fromJson(json['data']) : null;
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

class ContentDetail {
  final int? id;
  final String? title;
  final String? body;
  final String? type;
  final String? category;
  final bool? isLocationVisible;
  final int? likeCount;
  final int? viewCount;
  final int? commentCount;
  final int? reportCount;
  final String? status;
  final String? address;
  final AuthorUser? authorUser;
  final List<String>? files;
  final List<Comments>? comments;
  final bool? isLiked;
  final String? createdAt;
  final String? lastModifiedAt;

  const ContentDetail({
    this.id,
    this.title,
    this.body,
    this.type,
    this.category,
    this.isLocationVisible,
    this.likeCount,
    this.viewCount,
    this.commentCount,
    this.reportCount,
    this.status,
    this.address,
    this.authorUser,
    this.files,
    this.comments,
    this.isLiked,
    this.createdAt,
    this.lastModifiedAt,
  });

  factory ContentDetail.fromJson(Map<String, dynamic> json) {
    return ContentDetail(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      type: json['type'],
      category: json['category'],
      isLocationVisible: json['isLocationVisible'],
      likeCount: json['likeCount'],
      viewCount: json['viewCount'],
      commentCount: json['commentCount'],
      reportCount: json['reportCount'],
      status: json['status'],
      address: json['address'],
      authorUser: json['authorUser'] != null
          ? AuthorUser.fromJson(json['authorUser'])
          : null,
      files: json['files']?.cast<String>(),
      comments: json['comments'] != null
          ? json['comments']
          .map<Comments>((v) => Comments.fromJson(v))
          .toList()
          : null,
      isLiked: json['isLiked'],
      createdAt: json['createdAt'],
      lastModifiedAt: json['lastModifiedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type,
      'category': category,
      'isLocationVisible': isLocationVisible,
      'likeCount': likeCount,
      'viewCount': viewCount,
      'commentCount': commentCount,
      'reportCount': reportCount,
      'status': status,
      'address': address,
      'authorUser': authorUser?.toJson(),
      'files': files,
      'comments': comments?.map((v) => v.toJson()).toList(),
      'isLiked': isLiked,
      'createdAt': createdAt,
      'lastModifiedAt': lastModifiedAt,
    };
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

class Comments {
  int? id;
  String? body;
  AuthorUser? author;
  int? likeCount;
  int? parentCommentId;
  String? createdAt;
  String? lastModifiedAt;
  List<String>? children;
  bool? isLiked;

  Comments(
      {this.id,
        this.body,
        this.author,
        this.likeCount,
        this.parentCommentId,
        this.createdAt,
        this.lastModifiedAt,
        this.children,
        this.isLiked});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    author =
    json['author'] != null ? new AuthorUser.fromJson(json['author']) : null;
    likeCount = json['likeCount'];
    parentCommentId = json['parentCommentId'];
    createdAt = json['createdAt'];
    lastModifiedAt = json['lastModifiedAt'];
    children = json['children'].cast<String>();
    isLiked = json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['likeCount'] = this.likeCount;
    data['parentCommentId'] = this.parentCommentId;
    data['createdAt'] = this.createdAt;
    data['lastModifiedAt'] = this.lastModifiedAt;
    data['children'] = this.children;
    data['isLiked'] = this.isLiked;
    return data;
  }
}