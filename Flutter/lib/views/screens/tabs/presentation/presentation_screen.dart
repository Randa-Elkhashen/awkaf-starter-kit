import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/tabs/presentation/gallery_screen.dart';
import 'package:flutter_app/views/screens/tabs/presentation/model_3d_screen.dart';
import 'package:flutter_app/views/screens/tabs/presentation/panorama_screen.dart';
import 'package:flutter_app/views/screens/tabs/presentation/web_view_screen.dart';
import 'package:flutter_app/views/style/app_style.dart';
class PresentationScreen extends StatelessWidget {
  const PresentationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SizedBox(
          height: AppStyle.scaleFactor * 260,
            child: GalleryScreen()),
        SizedBox(height: AppStyle.size.height/10,),
        ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_)=> const PanoramaView())
              );
            },
            child: const Text("Panorama 360")
        ),
        ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_)=> const Model3DView())
              );
            },
            child: const Text("3D Model")
        ),
        ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_)=> const WebViewExample())
              );
            },
            child: const Text("WebView")
        ),
      ],
    );
  }
}
