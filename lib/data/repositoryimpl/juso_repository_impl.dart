import 'package:daepiro/data/source/onboarding/juso_service.dart';
import 'package:daepiro/domain/repository/juso_repository.dart';

class JusoRepositoryImpl extends JusoRepository {
  JusoRepositoryImpl({required JusoService service}) : _service = service;
  final JusoService _service;

  @override
  Future<List<String>> getjusoList({required String inputJuso, required int currentPage}) async {
    try {
      final jusoResponse = await _service.getJusoList(keyword: inputJuso, currentPage: currentPage);
      Set<String> jusoList = Set();
      for (var juso in jusoResponse.results!.juso!) {
        String formattedJuso = "${juso.siNm} ${juso.sggNm} ${juso.emdNm}"; // 도로명 주소와 지번 주소를 조합
        jusoList.add(formattedJuso);
      }
      return jusoList.toList();
    } catch(e) {
      print('주소 리스트 오류 ${e.toString()}');
      rethrow;
    }
  }
}