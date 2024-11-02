import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  int _selectedPopularPostCategory = 0;
  int get selectedPopularPostCategory => _selectedPopularPostCategory;



  void selectPopularPostCategory(int index) {
    _selectedPopularPostCategory = index;
    notifyListeners();
  }

}