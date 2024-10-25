import 'package:stacked/stacked.dart';

class GenderViewModel extends BaseViewModel {
  int _selectedGender = -1; // -1 means no gender selected
  int get selectedGender => _selectedGender;

  int _currentPage = 0; // Initialize currentPage to 0
  int get currentPage => _currentPage;

  void selectGender(int index) {
    // Set the selected gender based on the index
    _selectedGender = index; // Set the selected gender
    notifyListeners(); // Notify listeners to update UI
  }

  void goToNext() {
    // Increment currentPage but don't exceed the number of pages
    if (_currentPage < 5) { // 5 because currentPage starts from 0
      _currentPage++;
    } else {
      // Handle the case where you reach the last page (if needed)
      print("Reached the last page.");
    }
    notifyListeners();
  }
}
