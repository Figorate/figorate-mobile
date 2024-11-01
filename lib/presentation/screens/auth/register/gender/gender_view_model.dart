import 'package:stacked/stacked.dart';

class GenderViewModel extends BaseViewModel {
  int _selectedGender = -1;
  int get selectedGender => _selectedGender;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  void selectGender(int index) {
    _selectedGender = index; 
      print("Selected Gender Index: $_selectedGender"); // Debug statement
    notifyListeners(); 
  }

  void goToNext() {
    if (_currentPage < 5) {
      _currentPage++;
    } else {
      print("Reached the last page.");
    }
    notifyListeners();
  }
}

