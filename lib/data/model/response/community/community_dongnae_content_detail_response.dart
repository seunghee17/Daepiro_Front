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
        json['data'] != null ? ContentDetail.fromJson(json['data']) : null;
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
          : const AuthorUser(
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['type'] = type;
    data['category'] = category;
    data['isLocationVisible'] = isLocationVisible;
    data['likeCount'] = likeCount;
    data['viewCount'] = viewCount;
    data['commentCount'] = commentCount;
    data['reportCount'] = reportCount;
    data['status'] = status;
    data['authorUser'] = authorUser.toJson();
      data['files'] = files;
    data['comments'] = comments.map((v) => v.toJson()).toList();
      data['isLiked'] = isLiked;
    data['createdAt'] = createdAt;
    data['lastModifiedAt'] = lastModifiedAt;
    return data;
  }
}

class AuthorUser {
  final int userId;
  final String nickname;
  final String realname;
  final bool isCompletedOnboarding;
  final String profileImageUrl;
  final bool isVerified;

  const AuthorUser(
      {this.userId = 0,
      this.nickname = '',
      this.realname = '',
      this.isCompletedOnboarding = false,
      this.profileImageUrl = '',
      this.isVerified = false});

  factory AuthorUser.fromJson(Map<String, dynamic> json) {
    return AuthorUser(
        userId: json['userId'] ?? 0,
        nickname: json['nickname'] ?? '',
        realname: json['realname'] ?? '',
        isCompletedOnboarding: json['isCompletedOnboarding'] ?? false,
        profileImageUrl: json['profileImageUrl'] ?? '',
        isVerified: json['isVerified'] ?? false);
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
        json['author'] != null ? AuthorUser.fromJson(json['author']) : null;
    likeCount = json['likeCount'];
    parentCommentId = json['parentCommentId'];
    createdAt = json['createdAt'];
    lastModifiedAt = json['lastModifiedAt'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
    isLiked = json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['body'] = body;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    data['likeCount'] = likeCount;
    data['parentCommentId'] = parentCommentId;
    data['createdAt'] = createdAt;
    data['lastModifiedAt'] = lastModifiedAt;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    data['isLiked'] = isLiked;
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
        json['author'] != null ? AuthorUser.fromJson(json['author']) : null;
    likeCount = json['likeCount'];
    parentCommentId = json['parentCommentId'];
    createdAt = json['createdAt'];
    lastModifiedAt = json['lastModifiedAt'];
    isLiked = json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['body'] = body;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    data['likeCount'] = likeCount;
    data['parentCommentId'] = parentCommentId;
    data['createdAt'] = createdAt;
    data['lastModifiedAt'] = lastModifiedAt;
    data['isLiked'] = isLiked;
    return data;
  }
}
