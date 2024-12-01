import 'package:daepiro/data/model/response/home/home_status_response.dart';
import 'package:daepiro/data/source/home/home_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/http/http_provider.dart';
import '../../data/repositoryimpl/home/home_repository_impl.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final http = ref.watch(dioProvider);
  return HomeRepositoryImpl(service: HomeService(http));
});

abstract class HomeRepository {
  Future<HomeStatusResponse> getHomeStatus();

}
