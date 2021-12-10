import 'package:flutter/material.dart';
import 'package:news_app/views/screens/news_screen.dart';

import 'views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primaryColor: const Color(0xFF39A552),
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        NewsScreen.routeName: (context) => NewsScreen(),
      },
    );
  }
}
