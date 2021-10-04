import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/view_helpers/imports.dart';

import 'package:flutter_app/views/widgets/custom_radio_button.dart';

enum NEWS_FONT { SMALL, NORMAL, LARGE, LARGER }

class SelectFontSizeScreen extends StatefulWidget {
  @override
  _SelectFontSizeScreenState createState() => _SelectFontSizeScreenState();
}

class _SelectFontSizeScreenState extends State<SelectFontSizeScreen> {
  NEWS_FONT newsFontSize = NEWS_FONT.NORMAL;
  // user Actions
  _setFontSize(NEWS_FONT fontsize) async {
    newsFontSize = fontsize;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var fonts = [
      {'title': 'Small', 'type': NEWS_FONT.SMALL},
      {'title': 'Normal', 'type': NEWS_FONT.NORMAL},
      {'title': 'Large', 'type': NEWS_FONT.LARGE},
      {'title': 'Larger', 'type': NEWS_FONT.LARGER},
    ];
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(height: AppDimensions.convertToH(4)),
          ...fonts.map((e) => _buildFontContainer(e)).toList(),
          SizedBox(height: AppDimensions.convertToH(40)),
          _buildFontTestTextWidget(),
        ]),
      ),
    );
  }

  Widget _buildFontContainer(font) {
    return GestureDetector(
      onTap: () async => await _setFontSize(font['type']),
      child: Card(
        elevation: .1,
        margin: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.convertToW(16)),
          height: AppDimensions.convertToH(54.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                font['title'],
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 17,
                ),
              ),
              CustomRadioButton(
                props: CustomRadioButtonProps(isSelected: font['type'] == newsFontSize),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFontTestTextWidget() {
    double fontSizeAdded = 0;
    if (newsFontSize == NEWS_FONT.SMALL) {
      fontSizeAdded = -4;
    }
    if (newsFontSize == NEWS_FONT.LARGE) {
      fontSizeAdded = 4;
    }
    if (newsFontSize == NEWS_FONT.LARGER) {
      fontSizeAdded = 6;
    }
    return Center(
      child: Text(
        ' Demo Text For Font Selection ',
        style: TextStyle(
          fontSize: 16 + fontSizeAdded,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
