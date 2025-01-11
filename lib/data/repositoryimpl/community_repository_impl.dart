import 'package:daepiro/data/model/request/community_comment_post_request.dart';
import 'package:daepiro/data/model/request/community_disaster_edit_request.dart';
import 'package:daepiro/data/model/request/community_reply_report_request.dart';
import 'package:daepiro/data/model/response/community_article_write_response.dart';
import 'package:daepiro/data/model/response/community_comment_post_response.dart';
import 'package:daepiro/data/model/response/community_disaster_edit_response.dart';
import 'package:daepiro/data/model/response/community_dongnae_content_detail_response.dart';
import 'package:daepiro/data/model/response/community_reply_like_response.dart';
import 'package:daepiro/data/model/response/community_reply_report_response.dart';
import 'package:daepiro/data/model/response/disaster_reply_delete_response.dart';
import 'package:daepiro/data/model/response/disaster_reply_response.dart';
import 'package:daepiro/data/model/response/disaster_response.dart';
import 'package:daepiro/domain/repository/community_repository.dart';
import 'package:dio/src/multipart_file.dart';

import '../model/response/community_dongnae_content_response.dart';
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
      print('재난상황 수신 타입 데이터 오류 ${e}');
      return [];
    }
  }

  @override
  Future<List<Reply>> getDisasterReply(int situationId) async {
    try {
      final response =
      await _service.getDisasterReply(situationId: situationId.toString());
      if (response.data == null) {
        return [];
      } else {
        return response.data!;
      }
    } catch (e) {
      print('재난 상황 댓글 데이터 로드 오류 ${e}');
      return [];
    }
  }

  @override
  Future<DeleteReplyResponse> deleteReply(int id) async {
    return await _service.deleteReply(id: id);
  }

  @override
  Future<CommunityDisasterEditResponse> editReply({required int id,
    required CommunityDisasterEditRequest
    communityDisasterEditRequest}) async {
    try {
      final response = await _service.editReply(
          id: id, communityDisasterEditRequest: communityDisasterEditRequest);
      if (response.code != 1000) {
        throw Exception('Error occur ${response.code}');
      } else {
        return response;
      }
    } catch (e) {
      print('재난 상황 편집 로드 오류 ${e}');
      rethrow;
    }
  }

  @override
  Future<CommunityDongnaeContentResponse> getDongNaeContent({
    required String type,
    required String? category,
    required String status,
    required String address,
    required int page,
    required int size,
  }) async {
    try {
      final response = await _service.dongNaeContent(
        type: type,
        category: category,
        status: status,
        address: address,
        page: page,
        size: size,
      );
      if (response.code != 1000) {
        throw Exception('Error occurred: ${response.message}');
      }
      return response;
    } catch (e) {
      print('동네생활 게시글 로드중 오류 발생: $e');
      rethrow;
    }
  }

  @override
  Future<CommunityCommentPostResponse> setComment(
      CommunityCommentPostRequest communityCommentPostRequest) async {
    try {
      return await _service.setComment(
          communityCommentPostRequest: communityCommentPostRequest);
    } catch (e) {
      print('댓글 작성중 오류 발생 ${e}');
      rethrow;
    }
  }

  @override
  Future<CommunityDongNaeDetailContentResponse> getDongNaeDetailContent(
      {required int id}) async {
    try {
      return await _service.dongNaeDetailContent(id: id);
    } catch (e) {
      print('동네생활 게시글 상세조회 오류 발생 ${e}');
      rethrow;
    }
  }

  @override
  Future<CommunityReplyLikeResponse> communityReplyLike(
      {required int id}) async {
    try {
      return await _service.communityReplyLike(id: id);
    } catch (e) {
      print('댓글 좋아요 ${e}');
      rethrow;
    }
  }

  @override
  Future<CommunityReplyReportResponse> communityReplyReport({required int id,
    required CommunityReplyReportRequest communityReplyReportRequest}) async {
    try {
      return await _service.communityReplyReport(
          id: id, communityReplyReportRequest: communityReplyReportRequest);
    } catch (e) {
      print('댓글 신고 오류 발생 ${e}');
      rethrow;
    }
  }

  @override
  Future<CommunityArticleWritingResponse> setArticleData(
      {
        required String articleCategory,
        required String title,
        required String body,
        required bool visibility,
        required double longitude,
        required double latitude,
        required List<MultipartFile> attachFileList}) async {
    try {
      return await _service.setArticleData(
          articleType: 'DONGNE',
          articleCategory: articleCategory,
          title: title,
          body: body,
          visibility: visibility,
          longitude: longitude,
          latitude: latitude,
          attachFileList: attachFileList);
    } catch(e) {
      print('게시글 작성중 오류 발생 ${e}');
      rethrow;
    }
  }
}
