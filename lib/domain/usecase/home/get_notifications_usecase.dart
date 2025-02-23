import 'package:daepiro/data/model/response/home/disasters_history_response.dart';
import 'package:daepiro/data/model/response/home/notification_response.dart';
import 'package:daepiro/domain/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getNotificationsUsecaseProvider = FutureProvider
    .family<NotificationResponse, GetNotificationsUsecase>((ref, request) async {
  final repository = ref.watch(homeRepositoryProvider);
  return await repository.getNotifications();
});

class GetNotificationsUsecase {
  GetNotificationsUsecase();
}
