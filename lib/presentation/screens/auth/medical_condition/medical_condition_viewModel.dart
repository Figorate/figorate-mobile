import 'package:stacked/stacked.dart';

class MedicalConditionViewmodel extends BaseViewModel {
  final List<int> _selectedMedicalConditions = [];
  List<int> get selectedMedicalConditions => _selectedMedicalConditions;

  void toggleMedicalCondition(int index) {
    if (_selectedMedicalConditions.contains(index)) {
      _selectedMedicalConditions.remove(index);
      print("Removed Medical Condition Index: $index");
    } else {
      _selectedMedicalConditions.add(index);
      print("Added Medical Condition Index: $index");
    }
    notifyListeners();
  }
}
