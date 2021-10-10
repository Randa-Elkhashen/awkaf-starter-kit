import 'package:flutter/material.dart';
import 'package:flutter_app/views/widgets/loaders/image_loader.dart';
class ImageView extends StatelessWidget {
  final String url;

  const ImageView({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (_)=> Scaffold(
                    body: InteractiveViewer(
                      child: Center(
                        child: ImageLoader(
                          url: url,
                        ),
                      ),
                    )
                )
            )
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ImageLoader(
          url:url,
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}
