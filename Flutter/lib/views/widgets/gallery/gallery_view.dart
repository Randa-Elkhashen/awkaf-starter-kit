
import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/managers/validator_controller.dart';
import 'package:flutter_app/views/widgets/gallery/sound_cloud_player.dart';
import 'package:flutter_app/views/widgets/gallery/youtuble_player.dart';

import 'app_web_view.dart';
import 'image_view.dart';
class GalleryView extends StatelessWidget {
  final String url;
  const GalleryView({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(["png",'jpg'].contains(url.split(".").last)) {
      return ImageView(url: url);
    }
    String? _youTubeId = Validator.convertUrlToYouTubeId(url);
    Uri _uri = Uri.parse(url);
    if(_uri.host ==  "www.soundcloud.com" || _uri.host == "soundcloud.com"){
      return SoundCloudPlayer(url: url);
    } else if(_youTubeId != null){
      return YoutubePlayer(id: _youTubeId,);
    }
    return AppWebView(uri: _uri,);

  }
}
