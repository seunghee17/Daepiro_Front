import 'dart:ffi';

import 'package:daepiro/data/model/response/home/home_status_response.dart';
import 'package:daepiro/data/source/home/home_service.dart';
import 'package:daepiro/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({required HomeService service}) : _service = service;
  final HomeService _service;

  @override
  Future<HomeStatusResponse> getHomeStatus() async {
    try {
      final homeResponse = await _service.getHomeStatus();
      return homeResponse;
    } catch(e) {
      print('주소 리스트 오류 ${e.toString()}');
      rethrow;
    }
  }

}
