import 'package:flutter/material.dart';
import 'package:flutter_app/views/widgets/gallery/gallary_view.dart';

class GalleryInRow extends StatefulWidget {
  final List<String> urls;
  final double viewFraction;
  final int initialIndex;
  final double height;

  const GalleryInRow(
      {Key? key,
      required this.urls,
      this.viewFraction = 1.0,
      this.initialIndex = 0,
      required this.height})
      : super(key: key);

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
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
          controller: _pageController,
          itemCount: widget.urls.length,
          itemBuilder: (context, index) {
            return GalleryView(url: widget.urls[index]);
          }),
    );
  }
}
