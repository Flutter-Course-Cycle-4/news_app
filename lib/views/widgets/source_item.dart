import 'package:flutter/material.dart';
import 'package:news_app/controllers/news_provider.dart';
import 'package:news_app/models/news_api_manager.dart';
import 'package:news_app/models/source.dart';
import 'package:provider/provider.dart';

class SourceItem extends StatelessWidget {
  final Source source;
  const SourceItem(this.source, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected =
        source.name == Provider.of<NewsProvider>(context).selectedSource!.name;
    return Container(
      margin: EdgeInsets.all(10),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
        ),
        onPressed: () {
          Provider.of<NewsProvider>(context, listen: false)
              .changeSelectedSource(source);
        },
        child: FittedBox(
            child: Text(
          source.name,
          style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).primaryColor,
          ),
        )),
      ),
    );
  }
}
