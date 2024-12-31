import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final errorNotifierProvider = StateNotifierProvider<ErrorNotifier, DioException?>(
    (ref) => ErrorNotifier(),
);

class ErrorNotifier extends StateNotifier<DioException?> {
  ErrorNotifier(): super(null);

  void addError(DioException exception) => state = exception;
  void clearError() => state = null;
}
