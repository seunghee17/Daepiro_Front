import 'dart:ffi';

import 'package:daepiro/data/model/request/register_user_location_request.dart';
import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/data/model/response/information/around_shelter_list_response.dart';
import 'package:daepiro/data/model/response/information/disaster_contents_list_response.dart';
import 'package:daepiro/data/model/response/information/disaster_contents_response.dart';
import 'package:daepiro/data/source/information/information_service.dart';
import 'package:daepiro/domain/repository/information_repository.dart';

class InformationRepositoryImpl extends InformationRepository {
  InformationRepositoryImpl({required InformationService service}) : _service = service;
  final InformationService _service;

  @override
  Future<DisasterContentsResponse> getDisasterContents() async {
    try {
      final response = await _service.getDisasterContents();
      return response;
    } catch(e) {
      print('재난콘텐츠 조회 오류 ${e.toString()}');
      rethrow;
    }
  }

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
  Future<BasicResponse> registerUserLocation({
    required RegisterUserLocationRequest body
  }) async {
    try {
      final response = await _service.registerUserLocation(
          body: body
      );
      return response;
    } catch(e) {
      print('사용자 위치 등록 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<AroundShelterListResponse> getAroundShelterList({
    required String type
  }) async {
    try {
      final response = await _service.getAroundShelterList(
          type: type
      );
      return response;
    } catch(e) {
      print('주변대피소 조회 오류 ${e.toString()}');
      rethrow;
    }
  }

}
