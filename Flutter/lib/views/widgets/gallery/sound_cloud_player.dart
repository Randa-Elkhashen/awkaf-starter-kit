import 'package:flutter/material.dart';

import 'app_web_view.dart';
class SoundCloudPlayer extends StatelessWidget {
  final String url;
  const SoundCloudPlayer({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWebView(
      data: """
             <iframe width="100%" height="100%" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=$url&color=%23ff5500&auto_play=true&hide_related=true&show_comments=false&show_user=false&show_reposts=false&show_teaser=false&visual=true"></iframe>
            """,
    );
  }
}
