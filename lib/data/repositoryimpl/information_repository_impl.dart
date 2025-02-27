import 'package:daepiro/data/model/request/register_user_location_request.dart';
import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/data/model/response/information/around_shelter_list_response.dart';
import 'package:daepiro/data/model/response/information/behavior_list_response.dart';
import 'package:daepiro/data/model/response/information/disaster_contents_list_response.dart';
import 'package:daepiro/data/source/information/information_service.dart';
import 'package:daepiro/domain/repository/information_repository.dart';

class InformationRepositoryImpl extends InformationRepository {
  InformationRepositoryImpl({required InformationService service}) : _service = service;
  final InformationService _service;

  @override
  Future<DisasterContentsListResponse> getDisasterContentsList({
    required String sortType,
    required String size
  }) async {
    try {
      final response = await _service.getDisasterContentsList(
        sortType: sortType,
        size: size
      );
      return response;
    } catch(e) {
      print('재난콘텐츠 목록 조회 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<DisasterContentsListResponse> searchDisasterContents({
    required String keyword,
    required String size
  }) async {
    try {
      final response = await _service.searchDisasterContents(
          keyword: keyword,
          size: size
      );
      return response;
    } catch(e) {
      print('재난콘텐츠 검색 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<BehaviorListResponse> getBehaviorList({
    required String type
  }) async {
    try {
      final response = await _service.getBehaviorList(
          type: type
      );
      return response;
    } catch(e) {
      rethrow;
    }
  }

  @override
  Future<BehaviorListResponse> searchDisasterType({
    required String keyword
  }) async {
    try {
      final response = await _service.searchDisasterType(
          keyword: keyword
      );
      return response;
    } catch(e) {
      rethrow;
    }
  }


}
