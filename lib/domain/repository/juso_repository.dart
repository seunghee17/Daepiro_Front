import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositoryimpl/juso_repository_impl.dart';
import '../../data/source/onboarding/juso_service.dart';

final jusoRepositoryProvider = Provider<JusoRepository>((ref) {
  final dio = Dio();
  return JusoRepositoryImpl(service: JusoService(dio));
});

abstract class JusoRepository {
  Future<List<String>> getjusoList({required String inputJuso, required int currentPage});
}