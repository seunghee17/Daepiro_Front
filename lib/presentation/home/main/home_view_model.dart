import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_view_model.g.dart';

@riverpod
// class HomeViewModel extends ChangeNotifier {
class HomeViewModel extends _$HomeViewModel {
  int _selectedPopularPostCategory = 0;
  int get selectedPopularPostCategory => _selectedPopularPostCategory;



  void selectPopularPostCategory(int index) {
    _selectedPopularPostCategory = index;
    // notifyListeners();
  }

}
