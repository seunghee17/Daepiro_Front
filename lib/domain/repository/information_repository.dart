import 'package:daepiro/data/model/response/information/disaster_contents_response.dart';
import 'package:daepiro/data/source/information/information_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/http/http_provider.dart';
import '../../data/model/response/information/disaster_contents_list_response.dart';
import '../../data/repositoryimpl/information_repository_impl.dart';

final informationRepositoryProvider = Provider<InformationRepository>((ref) {
  final http = ref.watch(dioProvider);
  return InformationRepositoryImpl(service: InformationService(http));
});

abstract class InformationRepository {
  Future<DisasterContentsResponse> getDisasterContents();
  Future<DisasterContentsListResponse> getDisasterContentsList({
    required String sortType,
    required String size
  });

}
