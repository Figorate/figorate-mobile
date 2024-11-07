import 'package:stacked/stacked.dart';

class MedicalConditionViewmodel extends BaseViewModel {
  int _selectedMedicalCondition = -1;
  int get selectedMedicalCondition => _selectedMedicalCondition;

  void selectMedicalCondition(int index) {
    _selectedMedicalCondition = index;
    print("Selected Medical Condition Index: $_selectedMedicalCondition");
    notifyListeners();
  }
}
