import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../model/response/onboarding/jusolist_response.dart';
part 'juso_service.g.dart';

@RestApi(baseUrl: "https://business.juso.go.kr/addrlink/")
abstract class JusoService {
  factory JusoService(Dio dio) = _JusoService;

  @POST("addrLinkApi.do")
  Future<JusoListResponse> getJusoList({@Query("currentPage") int currentPage = 1,
  @Query("countPerPage") int countPerPage = 10,
  @Query("keyword") required String keyword,
  @Query("confmKey") String confmKey = "U01TX0FVVEgyMDI0MDkyMjE1NTk1MTExNTA5OTA=",
  @Query("hstryYn") String hstryYn = "Y",
  @Query("resultType") String resultType = "json"});
}