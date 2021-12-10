import 'package:flutter/material.dart';
import 'package:news_app/views/widgets/category_item.dart';
import 'package:news_app/views/widgets/category_screen_title.dart';
import 'package:news_app/views/widgets/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        drawer: const MyDrawer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('News App'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CategoryScreenTitle(),
              Expanded(
                  child: GridView.count(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: const [
                  CategoryItem.left(
                    'assets/images/ball.png',
                    'Sports',
                    Color(0xFFC91C22),
                  ),
                  CategoryItem.right(
                    'assets/images/Politics.png',
                    'Politics',
                    Color(0xFF003E90),
                  ),
                  CategoryItem.left(
                    'assets/images/health.png',
                    'Health',
                    Color(0xFFED1E79),
                  ),
                  CategoryItem.right(
                    'assets/images/bussines.png',
                    'Business',
                    Color(0xFFCF7E48),
                  ),
                  CategoryItem.left(
                    'assets/images/environment.png',
                    'Environment',
                    Color(0xFF4882CF),
                  ),
                  CategoryItem.right(
                    'assets/images/science.png',
                    'Science',
                    Color(0xFFF2D352),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
