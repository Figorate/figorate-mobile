import 'package:stacked/stacked.dart';

class GenderViewModel extends BaseViewModel {
  int _selectedGender = -1;
  int get selectedGender => _selectedGender;

  void selectGender(int index) {
    _selectedGender = index;
    print("Selected Gender Index: $_selectedGender");
    notifyListeners();
  }
}
