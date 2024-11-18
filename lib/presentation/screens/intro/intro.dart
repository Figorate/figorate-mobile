import 'package:figorate_mobile/presentation/screens/carousel/carousel.dart';
import 'package:flutter/material.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child:  CarouselScreen(),
      ),
    );
  }
}