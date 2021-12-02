import 'package:flutter/material.dart';
import 'package:flutter_app/view_models/topic.dart';
import 'package:flutter_app/views/widgets/loaders/lazy_loading.dart';
import 'package:flutter_app/views/widgets/loaders/no_item_found.dart';

import 'news_item.dart';

class NewsList extends StatelessWidget {
  final List<Topic> topics;
  final bool nextPage;
  final Future<void> Function() onLazyLoad;

  const NewsList({Key? key, required this.topics, required this.nextPage, required this.onLazyLoad})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// if no item found show no item found view
    /// else display our list
    if (topics.isEmpty) {
      return NoItemFound(
        message: "No news found",
      );
    }

    return LazyLoading(
      nextPage: nextPage,
      onLazyLoad: onLazyLoad,
      child: Scrollbar(
        child: ListView.builder(
            physics: RangeMaintainingScrollPhysics(),
            itemCount: topics.length,
            padding: EdgeInsets.symmetric(
                //horizontal: 16,
                vertical: 8),
            itemBuilder: (context, itemIndex) {
              Topic _topic = topics[itemIndex];
              return NewsItem(
                topic: _topic,
              );
            }),
      ),
    );
  }
}
