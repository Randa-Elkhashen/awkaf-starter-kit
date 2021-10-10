
import 'package:flutter/material.dart';
import 'package:flutter_app/views/style/app_style.dart';

import 'gallary_thumbnail.dart';
import 'gallary_view.dart';
class GalleryWithBar extends StatefulWidget {

  final double height;
  final List<String> urls;

  const GalleryWithBar({Key? key,required this.urls,required this.height}) : super(key: key);

  @override
  State<GalleryWithBar> createState() => _GalleryWithBarState();
}

class _GalleryWithBarState extends State<GalleryWithBar> {
  late double _itemWidth;
  late double _itemHeight;
  final ValueNotifier<int> _selectedUrl = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    _itemWidth =  110.0 * AppStyle.scaleFactor;
    _itemHeight =  82.0 * AppStyle.scaleFactor;
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          Expanded(
              child: ValueListenableBuilder<int>(
                  valueListenable: _selectedUrl,
                  builder: (context,value,_){
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds:400 ),
                      child: SizedBox.expand(
                        key: ValueKey(_selectedUrl.value),
                        child: GalleryView(url: widget.urls[_selectedUrl.value],),
                      ),
                    );
                  }
              )
          ),
          SizedBox(
            height: _itemHeight,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8
                ),
                itemCount: widget.urls.length,
                itemExtent: _itemWidth,
                itemBuilder: (context,index){
                  return GalleryThumbnail(
                    onPressed: (){
                      _selectedUrl.value = index;
                    },
                    url: widget.urls[index],
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
