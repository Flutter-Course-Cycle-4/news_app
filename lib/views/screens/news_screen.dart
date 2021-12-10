import 'package:flutter/material.dart';
import 'package:news_app/controllers/news_provider.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/source.dart';
import 'package:news_app/views/widgets/my_drawer.dart';
import 'package:news_app/views/widgets/news_item.dart';
import 'package:news_app/views/widgets/sources_bar.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = 'news';
  NewsScreen({Key? key}) : super(key: key);
  String? title;

  String get category => title!.toLowerCase();
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
        drawer: const MyDrawer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(title!),
        ),
        body: FutureBuilder<List<Source>?>(
            future: Provider.of<NewsProvider>(context, listen: false)
                .getSources(category),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              if (snapshot.data == null) {
                return const Center(
                    child: Text('Error has occurred please try again later.'));
              } else {
                return Column(
                  children: [
                    SourcesBar(snapshot.data!),
                    Expanded(
                      child: FutureBuilder<List<Article>?>(
                        future: Provider.of<NewsProvider>(context)
                            .getArticles(category),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator.adaptive());
                          }
                          if (snapshot.data == null) {
                            return const Center(
                                child: Text(
                                    'Error has occurred please try again later.'));
                          } else {
                            return ListView.builder(
                              itemExtent:
                                  MediaQuery.of(context).size.height * 0.35,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return NewsItem();
                              },
                            );
                          }
                        },
                      ),
                    )
                  ],
                );
              }
            }),
      ),
    );
  }
}
