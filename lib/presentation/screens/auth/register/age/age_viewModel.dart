import 'package:stacked/stacked.dart';

class AgeViewModel extends BaseViewModel {
  DateTime? dateOfBirth;

  void setDateOfBirth(DateTime date) {
    dateOfBirth = date;
    notifyListeners();
  }
}
