import 'package:stacked/stacked.dart';

class ResetPasswordViewmodel extends BaseViewModel {
  String _newPassword = '';
  String _confirmPassword = '';

  String? _newPasswordError;
  String? _confirmPasswordError;

  String get newPassword => _newPassword;
  String get confirmPassword => _confirmPassword;

  String? get newPasswordError => _newPasswordError;
  String? get confirmPasswordError => _confirmPasswordError;

  void onPasswordChanged(String value) {
    _newPassword = value;
    _newPasswordError = _validatePassword(value);
    notifyListeners();
  }

  void onConfirmPasswordChanged(String value) {
    _confirmPassword = value;
    _confirmPasswordError = _validateConfirmPassword(value);
    notifyListeners();
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!RegExp(r'[0-9]').hasMatch(password) && !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return 'Password must contain at least one number or special character';
    } else if (password.contains(' ')) {
      return 'Password cannot contain spaces';
    }
    return null;
  }

  String? _validateConfirmPassword(String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm Password cannot be empty';
    } else if (confirmPassword != _newPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  bool get isFormValid => _newPassword.isNotEmpty &&
      _confirmPassword.isNotEmpty &&
      _newPasswordError == null &&
      _confirmPasswordError == null;
}