
import 'package:daepiro/data/model/request/social_login_request.dart';
import 'package:daepiro/data/model/response/home/home_status_response.dart';
import 'package:daepiro/data/model/response/sociallogin_token_response.dart';

import '../../data/model/request/refresh_token_request.dart';
import '../../data/model/response/refresh_token_response.dart';

abstract class HomeRepository {
  Future<HomeStatusResponse> getHomeStatus();

}