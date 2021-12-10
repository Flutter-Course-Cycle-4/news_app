import 'package:flutter/material.dart';

class CategoryScreenTitle extends StatelessWidget {
  const CategoryScreenTitle({Key? key}) : super(key: key);
  final TextStyle textStyle = const TextStyle(
    color: Color(0xFF4F5A69),
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category',
            style: textStyle,
          ),
          Text(
            'of interest',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
