
abstract class JusoRepository {
  Future<List<String>> getjusoList({required String inputJuso, required int currentPage});
}