import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = 'news';
  NewsScreen({Key? key}) : super(key: key);
  String? title;
  @override
  Widget build(BuildContext context) {
    title = ModalRoute.of(context)!.settings.arguments as String;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bkg.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(title!),
        ),
      ),
    );
  }
}
