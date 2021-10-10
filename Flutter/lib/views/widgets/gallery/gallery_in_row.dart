import 'package:flutter/material.dart';

import 'gallary_view.dart';
class GalleryInRow extends StatefulWidget {
  final List<String> urls;
  final double viewFraction;
  final int initialIndex;

  const GalleryInRow({
    Key? key,
    required this.urls,
    this.viewFraction = 1.0,
    this.initialIndex = 0
  }) : super(key: key);

  @override
  _GalleryInRowState createState() => _GalleryInRowState();
}

class _GalleryInRowState extends State<GalleryInRow> {

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: widget.initialIndex,
        viewportFraction: widget.viewFraction,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.urls.length,
      itemBuilder: (context,index){
        return GalleryView(url: widget.urls[index]);
      }
    );
  }
}
