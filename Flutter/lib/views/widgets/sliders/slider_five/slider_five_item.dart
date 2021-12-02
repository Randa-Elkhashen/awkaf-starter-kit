import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/view_models/slider_model.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/widgets/loaders/image_loader.dart';
import 'package:flutter_app/views/widgets/titles/app_title.dart';
class SliderFiveItem extends StatelessWidget {
  final SliderModel item;
  final double factor;

  const SliderFiveItem({
    Key? key,required this.item,required this.factor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    print(factor);
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
       // ..setEntry(3, 2, .002)
      ..translate(
          0.0,
          factor* 22 * AppStyle.scaleFactor
      )
      ..scale((
         (8 + factor) / 10
      )//.clamp(.1, 1.0)
      )
      ,
      child: Opacity(
        opacity: (3-factor.abs() ).clamp(0.0, 1.0) ,
        child: OverflowBox(
          minHeight: AppStyle.size.height/3,
          maxHeight: AppStyle.size.height/3,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16* AppStyle.scaleFactor),
              topRight: Radius.circular(16* AppStyle.scaleFactor),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImageLoader(url: item.image,),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(32* AppStyle.scaleFactor),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(.3),
                        Colors.transparent,
                      ]
                    )
                  ),
                  child: AppTitle(item.title,color: Theme.of(context).colorScheme.onPrimary,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
