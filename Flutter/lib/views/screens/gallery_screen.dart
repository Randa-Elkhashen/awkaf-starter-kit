// ** Gallery ** //
// #
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/view_helpers/imports.dart';
import 'package:flutter_app/views/widgets/youtube_widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum Type {
  VIDEO,
  AUDIO,
  IMAGE,
}

class GalleryViewModel {
  String? name;
  String? url;
  Type? type;
  GalleryViewModel({required this.name, required this.url, required this.type});
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.orange,
      ),
      body: Container(
        width: AppDimensions.width,
        child: Column(
          children: [
            Container(
              height: AppDimensions.convertToH(200),
              width: AppDimensions.width,
              child: CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: galleryList
                    .map(
                      (GalleryViewModel item) => Container(
                        width: 1000,
                        height: AppDimensions.convertToH(200),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            //
                            if (item.type == Type.IMAGE)
                              Center(
                                child: Image.asset(
                                  item.url!,
                                  fit: BoxFit.cover,
                                  width: 1000,
                                ),
                              ),
                            if (item.type == Type.VIDEO)
                              Center(
                                child: YoutubeVideo(
                                initialKey: item.url!,
                              )),
                            if (item.type == Type.AUDIO)
                              Center(child: audioSoundCloudWidget(item.url)),
                            gallerySliderNumberText()
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: galleryList.asMap().entries.map((entry) {
                int index = galleryList.indexOf(entry.value);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _current = index;
                    });
                    _controller.animateToPage(entry.key);
                  },
                  child: gallerySliderIndicator(index),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget audioSoundCloudWidget(src) {
    var h = AppDimensions.convertToH(200);
    return Html(
      data: """
             <iframe width="100%" height="$h" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=$src&color=%23ff5500&auto_play=true&hide_related=true&show_comments=false&show_user=false&show_reposts=false&show_teaser=false&visual=true"></iframe>
            """,
      navigationDelegateForIframe: (NavigationRequest request) {
        if (request.url.contains("google.com/images")) {
          return NavigationDecision.prevent;
        } else {
          return NavigationDecision.navigate;
        }
      },
    );
  }

  Widget gallerySliderNumberText() {
    return Positioned(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Text('${(_current + 1).toString()}/${(galleryList.length).toString()}',
          style: TextStyle(color: Colors.white)),
    ));
  }

  Widget gallerySliderIndicator(index) {
    return Container(
      width: AppDimensions.convertToH(5.0),
      height: AppDimensions.convertToH(5.0),
      margin: EdgeInsets.symmetric(vertical: AppDimensions.convertToH(15), horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _current == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4),
      ),
    );
  }
}

// Dummy Gallery List
List<GalleryViewModel> galleryList = [
  GalleryViewModel(name: '', url: AppIcons.image1, type: Type.IMAGE),
  GalleryViewModel(name: '', url: AppIcons.image2, type: Type.IMAGE),
  GalleryViewModel(
      name: '', url: 'https://soundcloud.com/ishraq-zahde/dy8jvciznv6q', type: Type.AUDIO),
  GalleryViewModel(name: '', url: AppIcons.image3, type: Type.IMAGE),
  GalleryViewModel(name: '', url: 'K8C4yr7zavE', type: Type.VIDEO)
];
