import 'package:flutter/material.dart';
import 'package:flutter_app/view_models/topic.dart';
import 'package:flutter_app/views/widgets/loaders/image_loader.dart';
class TimeLineItem extends StatelessWidget {

  final Topic topic;
  final Function(Topic)? onPressed;

  const TimeLineItem({
    Key? key,
    required this.topic,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
