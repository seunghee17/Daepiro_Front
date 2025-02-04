import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/mypage/get_mypage_disaster_types_response.dart';
import '../../repository/mypage_repository.dart';

final getDisasterTypeUseCaseProvider = FutureProvider.family<GetMyPageDisasterTypesResponse, GetDisasterTypeUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.getMyDisasterTypes();
});

class GetDisasterTypeUseCase {
GetDisasterTypeUseCase();
}