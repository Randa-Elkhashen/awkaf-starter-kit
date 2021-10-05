
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class Model3DView extends StatelessWidget {
  const Model3DView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(
              Object(
                fileName: 'assets/3d_models/astronaut/Astronaut.obj',
                lighting: true,
                scale: Vector3.all(5.0),
                isAsset: true
              ),
            );
          },
        ),
      ),
    );
  }
}