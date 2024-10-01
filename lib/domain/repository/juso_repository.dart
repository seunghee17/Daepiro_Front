import '../../data/model/response/jusolist_response.dart';

abstract class JusoRepository {
  Future<List<Juso>> getjusoList({required String inputJuso});
}