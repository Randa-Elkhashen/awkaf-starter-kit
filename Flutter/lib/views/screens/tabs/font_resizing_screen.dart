import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/setting_provider.dart';
import 'package:flutter_app/views/style/imports.dart';

import 'package:flutter_app/views/widgets/custom_radio_button.dart';
import 'package:provider/provider.dart';

enum NEWS_FONT { SMALL, NORMAL, LARGE, LARGER }

class SelectFontSizeScreen extends StatefulWidget {
  @override
  _SelectFontSizeScreenState createState() => _SelectFontSizeScreenState();
}

class _SelectFontSizeScreenState extends State<SelectFontSizeScreen> {
  // user Actions
  _setFontSize(double fontsizeScale) async {
    await Provider.of<SettingProvider>(context, listen: false).setTextScaleFactor(fontsizeScale);
  }

  @override
  Widget build(BuildContext context) {
    var fonts = [
      {'title': 'Small', 'scale': 0.8},
      {'title': 'Normal', 'scale': 1.0},
      {'title': 'Large', 'scale': 1.2},
      {'title': 'Larger', 'scale': 1.5},
    ];
    return Scaffold(
      body: Center(
          child: Selector<SettingProvider, double>(
              selector: (_, provider) => provider.textScaleFactor,
              builder: (_, textScaleFactor, __) {
                return Column(children: [
                  SizedBox(height: AppDimensions.convertToH(4)),
                  ...fonts.map((e) => _buildFontContainer(e, textScaleFactor)).toList(),
                  SizedBox(height: AppDimensions.convertToH(40)),
                  _buildFontTestTextWidget(textScaleFactor),
                ]);
              })),
    );
  }

  Widget _buildFontContainer(font, textScaleFactor) {
    return GestureDetector(
      onTap: () => _setFontSize(font['scale']),
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
                  fontSize: 17,
                ),
              ),
              CustomRadioButton(
                props: CustomRadioButtonProps(isSelected: font['scale'] == textScaleFactor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFontTestTextWidget(double textScaleFactor) {
    return Center(
      child: Text(
        ' Demo Text For Font Selection ',
        style: TextStyle(fontSize: 16 * textScaleFactor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
