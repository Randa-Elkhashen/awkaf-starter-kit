import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/style/app_style.dart';

import 'gallery_view.dart';

class GalleryInRow extends StatelessWidget {
  final List<String> urls;
  final double viewFraction;
  final int initialIndex;
  final bool infinityScroll;
  final double height;
  final double aspectRatio;

  const GalleryInRow(
      {Key? key,
      required this.urls,
      this.viewFraction = 1.0,
      this.initialIndex = 0,
      required this.height,
      this.infinityScroll = false,
      this.aspectRatio = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CarouselSlider.builder(
        itemCount: urls.length,
        itemBuilder: (context, index, _) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4 * AppStyle.scaleFactor),
            child: GalleryView(url: urls[index]),
          );
        },
        options: CarouselOptions(
          initialPage: initialIndex,
          enableInfiniteScroll: infinityScroll,
          viewportFraction: viewFraction,
          //aspectRatio: aspectRatio
        ),
      ),
    );
  }
}
