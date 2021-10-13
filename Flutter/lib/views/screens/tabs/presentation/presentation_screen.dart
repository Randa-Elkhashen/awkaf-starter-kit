import 'package:flutter/material.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/views/screens/tabs/presentation/files_loader_screen.dart';
import 'package:flutter_app/views/screens/tabs/presentation/gallery_screen.dart';
import 'package:flutter_app/views/screens/tabs/presentation/model_3d_screen.dart';
import 'package:flutter_app/views/screens/tabs/presentation/panorama_screen.dart';
import 'package:flutter_app/views/screens/tabs/presentation/web_view_screen.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/widgets/gallery/gallery_with_bar.dart';
import 'package:flutter_app/views/widgets/gallery/gallery_in_row.dart';
class PresentationScreen extends StatelessWidget {
  const PresentationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> _links = [
      "https://www.presidency.eg/media/163551/p-8-00000000000jpg.jpg",
      "https://www.presidency.eg/media/163557/p-3-000jpg.jpg",
      "https://www.presidency.eg/media/163553/p-1-000jpg.jpg",
      "https://youtu.be/8YRL_57pF6c",
      "https://soundcloud.com/mrfavo/two-steps-from-hell-victory",
      "https://www.youtube.com/embed/pICAha0nsb0"
    ];

    return  ListView(

      padding: const EdgeInsets.all(16),

      children: [
        SizedBox(
          height: AppStyle.scaleFactor * 260,
            child: GalleryScreen()),
        GalleryInRow(
          viewFraction: .9,
          urls: _links,
          height: AppStyle.scaleFactor * 220,
        ),
        GalleryWithBar(
          height: AppStyle.scaleFactor * 260,
          urls: _links,
        ),
        SizedBox(height: AppStyle.scaleFactor * 10,),
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
                  MaterialPageRoute(builder: (_)=> const FilesLoaderScreen())
              );
            },
            child: const Text("Files Loaders")
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
