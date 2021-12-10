import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key}) : super(key: key);
  final secondaryTextStyle = const TextStyle(
    color: Color(0xFF79828B),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/NewsTest.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'BBC News•',
                    style: secondaryTextStyle,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Title of the news item',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '3 hourse agp',
                    style: secondaryTextStyle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
