import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/screens/home_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Center(
              child: Text(
                'News App!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              if (ModalRoute.of(context)!.settings.name !=
                  HomeScreen.routeName) {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              }
            },
            leading: const Icon(
              Icons.list,
              color: Colors.black,
              size: 30,
            ),
            title: const Text(
              'Categories',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
              size: 30,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
