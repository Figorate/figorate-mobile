import 'package:stacked/stacked.dart';

class HealthGoalViewmodel extends BaseViewModel {
  final List<int> _selectedHealthGoal = [];
  List<int> get selectedHealthGoal => _selectedHealthGoal;

  void toggleHealthGoal(int index) {
    if (_selectedHealthGoal.contains(index)) {
      _selectedHealthGoal.remove(index);
      print("Remove Preferences Index: $index");
    } else {
      _selectedHealthGoal.add(index);
      print("Added Preference Index: $index");
    }
    notifyListeners();
  }
}
