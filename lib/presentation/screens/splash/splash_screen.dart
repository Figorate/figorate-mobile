import 'package:figorate_mobile/core/theme/constant/assets.dart';
import 'package:figorate_mobile/presentation/screens/splash/splash_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) {
        viewModel.initializeSplashScreen();
      },
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: Center(
            child: Image.asset(
              Assets.figorateLogo,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
