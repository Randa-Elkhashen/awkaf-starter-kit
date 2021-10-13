import 'package:flutter/material.dart';
import 'package:flutter_app/view_models/topic.dart';
import 'package:flutter_app/views/widgets/loaders/loading_manager.dart';
import 'package:flutter_app/views/widgets/time_line/time_line_list.dart';
class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  _TimeLineScreenState createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {

  bool _isLoading = false;

  List<Topic> _topics = [];
  List<Topic> _testTopics = List.generate(
      20, (index) {
        return Topic(
          id: index,
          title: "Topic $index",
          imageUrl: "https://unsplash.com/photos/_Zua2hyvTBk/download?force=true&w=640",
          thumbnailUrl: "https://unsplash.com/photos/_Zua2hyvTBk/download?force=true&w=640",
          dateTime: DateTime.now().subtract(Duration(days: 5 * index))
        );
      }
  );

  @override
  void initState() {
    _topics.addAll(_testTopics);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            _isLoading = true;
            setState(() {});
            await Future.delayed(Duration(seconds: 2));
            _topics.clear();
            _topics.addAll(_testTopics);
            _isLoading = false;
            setState(() {});
          },
          child: TimeLineList(
            nextPage: true,
            onLazyLoad: () async {
              _isLoading = true;
              setState(() {});
              await Future.delayed(Duration(seconds: 2));
              _topics.addAll(_testTopics);
              _isLoading = false;
              setState(() {});
            },
            topics: _topics,
          ),
        ),
      ),
    );
  }
}
