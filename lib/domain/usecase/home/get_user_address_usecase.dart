import 'package:daepiro/data/model/response/home/disasters_history_response.dart';
import 'package:daepiro/data/model/response/home/user_address_response.dart';
import 'package:daepiro/domain/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUserAddressUsecaseProvider = FutureProvider
    .family<UserAddressResponse, GetUserAddressUsecase>((ref, request) async {
  final repository = ref.watch(homeRepositoryProvider);
  return await repository.getUserAddress();
});

class GetUserAddressUsecase {
  GetUserAddressUsecase();
}
