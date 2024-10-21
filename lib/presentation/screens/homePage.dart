import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive UI', style: TextStyle(fontSize: 20.sp)), // Responsive font size
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),  // Responsive padding
        child: Column(
          children: [
            Container(
              width: 300.w,  // Responsive width
              height: 150.h,  // Responsive height
              color: Colors.blue,
              child: Center(
                child: Text('Responsive Box', style: TextStyle(fontSize: 18.sp)),  // Responsive font size
              ),
            ),
            SizedBox(height: 20.h),  // Responsive spacing
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200.w, 60.h),  // Responsive button size
              ),
              child: Text('Responsive Button', style: TextStyle(fontSize: 16.sp)),  // Responsive font size
            ),
          ],
        ),
      ),
    );
  }
}