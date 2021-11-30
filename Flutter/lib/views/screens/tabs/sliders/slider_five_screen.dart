// example from
// https://xd.adobe.com/view/1585f088-2a70-4552-a4b8-24be33fd81eb-40d6/?fullscreen

import 'package:flutter/material.dart';
import 'package:flutter_app/view_models/slider_model.dart';
import 'package:flutter_app/views/widgets/sliders/slider_five/slider_five_list.dart';

class SliderFiveScreen extends StatefulWidget {
  const SliderFiveScreen({Key? key}) : super(key: key);

  @override
  _SliderFiveScreenState createState() => _SliderFiveScreenState();
}

class _SliderFiveScreenState extends State<SliderFiveScreen> {
  List<SliderModel> items = List.generate(
      15, (index) {
        return SliderModel(
            id: index,
            title: "Topic title $index",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            image: "https://unsplash.com/photos/3Sz0rX3Rxto/download?ixid=MnwxMjA3fDB8MXxhbGx8NXx8fHx8fDJ8fDE2MzgyNzE4NTI&force=true&w=640"
        );
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderFiveList(
       items: items,
      )
    );
  }
}
