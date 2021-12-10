import 'package:flutter/material.dart';
import 'package:news_app/views/screens/news_screen.dart';

class CategoryItem extends StatelessWidget {
  final String image, title;
  final Color color;
  final double subtractFromLeft, subtractFromRight;

  const CategoryItem.left(this.image, this.title, this.color, {key})
      : subtractFromLeft = 0,
        subtractFromRight = 40,
        super(key: key);
  const CategoryItem.right(this.image, this.title, this.color, {key})
      : subtractFromLeft = 40,
        subtractFromRight = 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushReplacementNamed(NewsScreen.routeName, arguments: title);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40).subtract(
            BorderRadius.only(
              bottomRight: Radius.circular(subtractFromRight),
              bottomLeft: Radius.circular(subtractFromLeft),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 3, child: Image.asset(image)),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
