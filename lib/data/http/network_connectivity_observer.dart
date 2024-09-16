import 'package:daepiro/data/http/connectivity_observer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkConnectivityObserver extends ConnectivityObserver {
  final Connectivity _connectivity = Connectivity();
  @override
  Stream<Status> observe() {
    return _connectivity.onConnectivityChanged.map((event) {
      print('네트워크 연결 서비스 !!! : ${event}');
      switch (event) {
        case ConnectivityResult.none:
          return Status.unavailable;
        default:
          return Status.available;
      }
    });
  }
}

final connectivityStatusProvider = StreamProvider<Status> ((ref) {
  final observer = NetworkConnectivityObserver();
  return observer.observe();
});