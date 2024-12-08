class DeleteReplyResponse {
  final int code;
  final String message;
  final dynamic data; // 데이터를 다양한 타입으로 처리하기 위해 dynamic 사용
  final String path;
  final String timestamp;

  DeleteReplyResponse({
    required this.code,
    required this.message,
    required this.data,
    required this.path,
    required this.timestamp,
  });

  factory DeleteReplyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteReplyResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'], // JSON의 data는 dynamic 타입으로 처리
      path: json['path'] as String,
      timestamp: json['timestamp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data,
      'path': path,
      'timestamp': timestamp,
    };
  }
}
