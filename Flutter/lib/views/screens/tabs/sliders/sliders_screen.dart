import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/tabs/sliders/slider_five_screen.dart';
import 'package:flutter_app/views/widgets/buttons/app_button.dart';
class SlidersScreen extends StatelessWidget {
  const SlidersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AppButton(
            text: "Slider Five",
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_)=> SliderFiveScreen()
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
