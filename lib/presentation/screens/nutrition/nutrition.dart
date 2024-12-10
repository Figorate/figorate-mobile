import 'package:figorate_mobile/presentation/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> currentIndex = ValueNotifier<int>(1);
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition'),
      ),
      body: Center(
        child: Text(
          'Hello, Flutter!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, index, child) {
          return BottomNavigationBarWidget(
            currentIndex: index,
            onTap: (newIndex) {
              currentIndex.value = newIndex; // Update the current index on tap
            },
          );
        },
      ),     );
  }
}
