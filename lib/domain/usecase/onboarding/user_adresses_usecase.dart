import 'package:daepiro/data/model/response/onboarding/user_address_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/onboarding_repository.dart';

final userAddressUseCaseProvider =
    FutureProvider.family<List<StoreAdress>, UserAddressUseCase>((ref, request) async {
          final repository = ref.watch(onboardingRepositoryProvider);
          return await repository.getUserAddress();
        });

class UserAddressUseCase {
  UserAddressUseCase();
}