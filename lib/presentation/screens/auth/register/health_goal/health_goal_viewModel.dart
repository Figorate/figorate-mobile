import 'package:stacked/stacked.dart';

class HealthGoalViewmodel extends BaseViewModel {
  int _selectedHealthGoal = -1;
  int get selectedHealthGoal => _selectedHealthGoal;

  void selectHealthGoal(int index) {
    _selectedHealthGoal = index;
    print("Selected Health Goal Index: $_selectedHealthGoal");
    notifyListeners();
  }
}
