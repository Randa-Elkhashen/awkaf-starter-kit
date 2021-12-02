import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class PanoramaView extends StatelessWidget {
  const PanoramaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Panorama(
          animSpeed: 2.5,
          sensitivity: 2.0,
          child: Image.asset("assets/images/panorama_360.jpg"),
        ),
      ),
    );
  }
}
