import 'package:stacked/stacked.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class TwoFactorAuthenticationViewModel extends BaseViewModel {
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'NG'); 
  PhoneNumber get phoneNumber => _phoneNumber;

  void onPhoneNumberChanged(PhoneNumber phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }
}
