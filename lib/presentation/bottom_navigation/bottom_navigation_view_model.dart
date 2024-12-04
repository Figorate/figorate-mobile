import 'package:stacked/stacked.dart';

class BottomNavViewModel extends BaseViewModel {
  int _currentIndex = 0;
  
  int get currentIndex => _currentIndex;

  void onItemTapped(int index) {
    _currentIndex = index;
    notifyListeners(); 
  }
}
