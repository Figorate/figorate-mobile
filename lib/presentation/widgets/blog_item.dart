import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:flutter/material.dart';

class BlogItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const BlogItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,  // Adjust the height as needed
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
