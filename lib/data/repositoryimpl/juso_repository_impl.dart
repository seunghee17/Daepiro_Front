import 'package:daepiro/data/model/response/jusolist_response.dart';
import 'package:daepiro/data/source/onboarding/juso_service.dart';
import 'package:daepiro/domain/repository/juso_repository.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'juso_repository_impl.g.dart';

class JusoRepositoryImpl extends JusoRepository {
  JusoRepositoryImpl({required JusoService service}) : _service = service;
  final JusoService _service;

  @override
  Future<List<Juso>> getjusoList({required String inputJuso}) async {
    try {
      final jusoResponse = await _service.getJusoList(keyword: inputJuso);
      return jusoResponse.results?.juso ?? [];
    } catch(e) {
      print('주소 리스트 오류 ${e.toString()}');
      return [];
    }
  }


}

@riverpod
JusoRepository jusoRepository(JusoRepositoryRef ref) {
  final dio = Dio();
  return JusoRepositoryImpl(service: JusoService(dio));
}