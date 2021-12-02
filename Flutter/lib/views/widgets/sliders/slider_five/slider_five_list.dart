import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view_models/slider_model.dart';
import 'package:flutter_app/views/widgets/sliders/slider_five/slider_five_item.dart';
class SliderFiveList extends StatefulWidget {

  final List<SliderModel> items;

  const SliderFiveList({Key? key,required this.items}) : super(key: key);

  @override
  _SliderFiveListState createState() => _SliderFiveListState();
}

class _SliderFiveListState extends State<SliderFiveList> {

  PageController _controller = PageController(
    initialPage: 1000,
    viewportFraction: .14,);
  ValueNotifier<double> _scrollIndex = ValueNotifier(1000.0);

  void _listener(){
    _scrollIndex.value = _controller.page!;
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: _scrollIndex,
      builder: (context,value,_){
        return PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _controller,
          //itemCount: widget.items.length,
          itemBuilder: (context,itemIndex){
            SliderModel item = widget.items[itemIndex % widget.items.length];
            double factor = (itemIndex - _scrollIndex.value).clamp(-4.0, 4.0);
            return SliderFiveItem(
              item: item,
              factor: factor,
            );
          },
        );
      },
    );
  }
}
