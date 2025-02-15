import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/mypage/get_mypage_address_response.dart';
import '../../repository/mypage_repository.dart';

final getAddressUseCaseProvider = FutureProvider.family<GetMyPageAddressResponse, GetAddressUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.getMyAddress();
});

class GetAddressUseCase {
  GetAddressUseCase();
}