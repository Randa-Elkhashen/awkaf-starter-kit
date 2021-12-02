import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates list of video players
class YoutubeVideo extends StatefulWidget {
  final initialKey;
  YoutubeVideo({required this.initialKey});
  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void _closeVideo() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.initialKey, //  'braVWtZNnsc',
      flags: const YoutubePlayerFlags(
          autoPlay: true, isLive: true, controlsVisibleAtStart: true, disableDragSeek: true),
    );

    return YoutubePlayer(
      key: ObjectKey(_controller),
      controller: _controller,
      actionsPadding: const EdgeInsets.only(left: 40.0),
      // topActions: [
      //   Padding(
      //     padding: EdgeInsets.all(5),
      //     child: IconButton(
      //       icon: Icon(
      //         Icons.close,
      //         color: Colors.white,
      //         size: AppDimensions.convertToW(18),
      //       ),
      //       onPressed: _closeVideo,
      //     ),
      //   ),
      // ],
    );
  }
}
