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
    data =
        json['data'] != null ? new ContentDetail.fromJson(json['data']) : null;
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
  final int id;
  final String title;
  final String body;
  final String type;
  final String category;
  final bool isLocationVisible;
  final int likeCount;
  final int viewCount;
  final int commentCount;
  final int reportCount;
  final String status;
  final AuthorUser authorUser;
  final List<String> files;
  final List<CommentData> comments;
  final bool isLiked;
  final String createdAt;
  final String lastModifiedAt;

  const ContentDetail({
    this.id = 0,
    this.title = '',
    this.body = '',
    this.type = '',
    this.category = '',
    this.isLocationVisible = false,
    this.likeCount = 0,
    this.viewCount = 0,
    this.commentCount = 0,
    this.reportCount = 0,
    this.status = '',
    this.authorUser = const AuthorUser(),
    this.files = const [],
    this.comments = const [],
    this.isLiked = false,
    this.createdAt = '',
    this.lastModifiedAt = '',
  });

  factory ContentDetail.fromJson(Map<String, dynamic> json) {
    return ContentDetail(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      type: json['type'] ?? '',
      category: json['category'] ?? '',
      isLocationVisible: json['isLocationVisible'] ?? false,
      likeCount: json['likeCount'] ?? 0,
      viewCount: json['viewCount'] ?? 0,
      commentCount: json['commentCount'] ?? 0,
      reportCount: json['reportCount'] ?? 0,
      status: json['status'] ?? '',
      authorUser: json['authorUser'] != null
          ? AuthorUser.fromJson(json['authorUser'])
          : AuthorUser(
              userId: 0,
              nickname: '',
              realname: '',
              isCompletedOnboarding: false,
              isVerified: false),
      files: (json['files'] ?? []).cast<String>(),
      comments: json['comments'] != null
          ? json['comments']
              .map<CommentData>((v) => CommentData.fromJson(v))
              .toList()
          : const [],
      isLiked: json['isLiked'] ?? false,
      createdAt: json['createdAt'] ?? '',
      lastModifiedAt: json['lastModifiedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['type'] = this.type;
    data['category'] = this.category;
    data['isLocationVisible'] = this.isLocationVisible;
    data['likeCount'] = this.likeCount;
    data['viewCount'] = this.viewCount;
    data['commentCount'] = this.commentCount;
    data['reportCount'] = this.reportCount;
    data['status'] = this.status;
    if (this.authorUser != null) {
      data['authorUser'] = this.authorUser!.toJson();
    }
    data['files'] = this.files;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['isLiked'] = this.isLiked;
    data['createdAt'] = this.createdAt;
    data['lastModifiedAt'] = this.lastModifiedAt;
    return data;
  }
}

class AuthorUser {
  final int userId;
  final String nickname;
  final String realname;
  final bool isCompletedOnboarding;
  final bool isVerified;

  const AuthorUser(
      {this.userId = 0,
      this.nickname = '',
      this.realname = '',
      this.isCompletedOnboarding = false,
      this.isVerified = false});

  factory AuthorUser.fromJson(Map<String, dynamic> json) {
    return AuthorUser(
        userId: json['userId'] ?? 0,
        nickname: json['nickname'] ?? '',
        realname: json['realname'] ?? '',
        isCompletedOnboarding: json['isCompletedOnboarding'] ?? false,
        isVerified: json['isVerified'] ?? false);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = userId;
    data['nickname'] = nickname;
    data['realname'] = realname;
    data['isCompletedOnboarding'] = isCompletedOnboarding;
    data['isVerified'] = isVerified;
    return data;
  }
}

class CommentData {
  int? id;
  String? body;
  AuthorUser? author;
  int? likeCount;
  int? parentCommentId;
  String? createdAt;
  String? lastModifiedAt;
  List<Children>? children;
  bool? isLiked;

  CommentData(
      {this.id,
      this.body,
      this.author,
      this.likeCount,
      this.parentCommentId,
      this.createdAt,
      this.lastModifiedAt,
      this.children,
      this.isLiked});

  CommentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    author =
        json['author'] != null ? new AuthorUser.fromJson(json['author']) : null;
    likeCount = json['likeCount'];
    parentCommentId = json['parentCommentId'];
    createdAt = json['createdAt'];
    lastModifiedAt = json['lastModifiedAt'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
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
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    data['isLiked'] = this.isLiked;
    return data;
  }
}

class Children {
  int? id;
  String? body;
  AuthorUser? author;
  int? likeCount;
  int? parentCommentId;
  String? createdAt;
  String? lastModifiedAt;
  bool? isLiked;

  Children({
    this.id,
    this.body,
    this.author,
    this.likeCount,
    this.parentCommentId,
    this.createdAt,
    this.lastModifiedAt,
    this.isLiked,
  });

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    author =
        json['author'] != null ? new AuthorUser.fromJson(json['author']) : null;
    likeCount = json['likeCount'];
    parentCommentId = json['parentCommentId'];
    createdAt = json['createdAt'];
    lastModifiedAt = json['lastModifiedAt'];
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
    data['isLiked'] = this.isLiked;
    return data;
  }
}
