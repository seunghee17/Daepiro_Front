import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/request/set_mypage_disaster_types_request.dart';
import '../../../data/model/response/basic_response.dart';
import '../../repository/mypage_repository.dart';

final setDisasterTypeUseCaseProvider = FutureProvider.family<BasicResponse, SetDisasterTypeUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.setDisasterTypes(request.setMypageDisasterTypesRequest);
});

class SetDisasterTypeUseCase {
  final SetMypageDisasterTypesRequest setMypageDisasterTypesRequest;
  SetDisasterTypeUseCase({required this.setMypageDisasterTypesRequest});
}