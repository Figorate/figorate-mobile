import 'package:stacked/stacked.dart';

class LoginViewmodel extends BaseViewModel {
  String _email = '';
  String _password = '';

  String? _emailError;
  String? _passwordError;

  String get email => _email;
  String get password => _password;

  String? get emailError => _emailError;
  String? get passwordError => _passwordError;

  void onEmailChanged(String value) {
    _email = value;
    _emailError = _validateEmail(value);
    notifyListeners();
  }

  void onPasswordChanged(String value) {
    _password = value;
    _passwordError = _validatePassword(value);
    notifyListeners();
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  bool get isFormValid => _email.isNotEmpty && _password.isNotEmpty;
}
