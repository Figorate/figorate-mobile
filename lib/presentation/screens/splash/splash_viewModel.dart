import 'package:figorate_mobile/presentation/screens/intro/intro.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  Future<void> initializeSplashScreen() async {
    await Future.delayed(const Duration(seconds: 8));
    navigationService.pushReplacement(IntroScreen());
  }
} 