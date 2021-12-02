import 'package:flutter/material.dart';

import 'app_web_view.dart';
class YoutubePlayer extends StatelessWidget {
  final String id;
  const YoutubePlayer({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWebView(
      uri: Uri.tryParse("https://www.youtube.com/embed/$id"),
    );
  }
}
