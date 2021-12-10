import 'package:flutter/material.dart';
import 'package:news_app/models/source.dart';
import 'package:news_app/views/widgets/source_item.dart';

class SourcesBar extends StatelessWidget {
  const SourcesBar(this.sources, {Key? key}) : super(key: key);
  final List<Source> sources;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sources.length,
        itemBuilder: (context, index) {
          return SourceItem(sources[index]);
        },
      ),
    );
  }
}
