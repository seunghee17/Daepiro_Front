import 'package:daepiro/data/model/response/disaster_reply_delete_response.dart';
import 'package:daepiro/data/model/response/disaster_reply_response.dart';
import 'package:daepiro/data/model/response/disaster_response.dart';
import 'package:daepiro/domain/repository/community_repository.dart';

import '../source/community/community_service.dart';

class CommunityRepositoryImpl implements CommunityRepository {
  CommunityRepositoryImpl({required CommunityService service})
      : _service = service;
  final CommunityService _service;

  @override
  Future<List<Data>> getAllDisasterResult() async {
    try {
      final response = await _service.getDisasterResult();
      if (response.data == null) {
        return [];
      } else {
        return response.data!;
      }
    } catch (e) {
      print('재난상황 데이터 오류 ${e}');
      return [];
    }
  }

  @override
  Future<List<Data>> getReceivedDisasterResult() async {
    try {
      final response = await _service.getDisasterResult();
      if (response.data == null) {
        return [];
      } else {
        final filteredList =
            response.data!.where((item) => item.isReceived!).toList();
        return filteredList;
      }
    } catch (e) {
      print('재난상황 데이터 오류 ${e}');
      return [];
    }
  }

  @override
  Future<List<Reply>> getDisasterReply() async {
    try {
      final response = await _service.getDisasterReply();
      if(response.data == null) {
        return [];
      } else {
        return response.data!;
      }
    } catch(e) {
      print('재난 상황 댓글 데이터 로드 오류 ${e}');
      return [];
    }
  }

  @override
  Future<DeleteReplyResponse> deleteReply(int commentId) async {
    return await _service.deleteReply(commentId: commentId);
  }
}
