import 'package:daepiro/data/model/request/register_user_location_request.dart';
import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/data/model/response/information/behavior_list_response.dart';
import 'package:daepiro/data/source/information/information_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/http/http_provider.dart';
import '../../data/model/response/information/around_shelter_list_response.dart';
import '../../data/model/response/information/disaster_contents_list_response.dart';
import '../../data/repositoryimpl/information_repository_impl.dart';

final informationRepositoryProvider = Provider<InformationRepository>((ref) {
  final http = ref.watch(dioProvider);
  return InformationRepositoryImpl(service: InformationService(http));
});

abstract class InformationRepository {
  Future<DisasterContentsListResponse> getDisasterContentsList({
    required String sortType,
    required String size
  });

  Future<DisasterContentsListResponse> searchDisasterContents({
    required String keyword,
    required String size
  });

  Future<BasicResponse> registerUserLocation({
    required RegisterUserLocationRequest body
  });

  Future<AroundShelterListResponse> getAroundShelterList({
    required String type
  });

  Future<BehaviorListResponse> getBehaviorList({required String type});
  Future<BehaviorListResponse> searchDisasterType({required String keyword});
}
