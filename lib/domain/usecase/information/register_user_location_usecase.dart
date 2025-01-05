import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/domain/repository/information_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/request/register_user_location_request.dart';

final registerUserLocationUsecaseProvider = FutureProvider
    .family<BasicResponse, RegisterUserLocationUsecase>((ref, request) async {
  final repository = ref.watch(informationRepositoryProvider);
  return await repository.registerUserLocation(
    body: RegisterUserLocationRequest(
      latitude: request.latitude,
      longitude: request.longitude
    ),
  );
});

class RegisterUserLocationUsecase {
  final String longitude;
  final String latitude;

  RegisterUserLocationUsecase({
    required this.longitude,
    required this.latitude,
  });
}
