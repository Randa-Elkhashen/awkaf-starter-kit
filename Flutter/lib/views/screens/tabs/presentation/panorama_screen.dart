import 'package:flutter/material.dart';
import 'package:flutter_app/views/widgets/loaders/image_loader.dart';
import 'package:panorama/panorama.dart';

class PanoramaView extends StatelessWidget {
  const PanoramaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: Panorama(
              animSpeed: 2.5,
              sensitivity: 2.0,
              child: ImageLoader(url: "https://unsplash.com/photos/luufnHoChRU/download?force=true&w=1920",) as Image
          )
      ),
    );
  }
}