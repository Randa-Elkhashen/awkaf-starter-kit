import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/text_to_speech_screen.dart';
import 'package:flutter_app/views/view_helpers/app_colors.dart';
import 'package:flutter_app/views/view_helpers/app_dimensions.dart';
import 'package:flutter_app/views/view_helpers/app_icons.dart';

import 'package:flutter_app/views/screens/font_resizing_screen.dart';
import 'package:flutter_app/views/screens/gallery_screen.dart';
import 'package:flutter_app/views/screens/listing_loading_scroll_screen.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: AppDimensions.convertToW(30));
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: AppColors.white,
        child: Container(
          padding: padding,
          child: Column(
            children: [
              SizedBox(height: AppDimensions.convertToH(30)),
              Container(
                child: Image.asset(
                  AppIcons.logo,
                  width: AppDimensions.convertToW(200),
                  height: AppDimensions.convertToH(230),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    buildMenuItem(
                      text: 'Gallery',
                      icon: Icons.photo_album,
                      onClicked: () => selectedItem(context, 0),
                    ),
                    buildMenuItem(
                      text: 'Text To Speech',
                      icon: Icons.mic,
                      onClicked: () => selectedItem(context, 1),
                    ),
                    buildMenuItem(
                      text: 'Font Resizing',
                      icon: Icons.text_format,
                      onClicked: () => selectedItem(context, 2),
                    ),
                    buildMenuItem(
                      text: 'Listing',
                      icon: Icons.list,
                      onClicked: () => selectedItem(context, 3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = AppColors.orange;
    return InkWell(
      splashColor: hoverColor,
      onTap: onClicked,
      child: Container(
        height: AppDimensions.convertToH(50),
        padding: EdgeInsets.symmetric(vertical: AppDimensions.convertToH(7)),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.orange.shade100,
            ),
          ),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: color,
                fontFamily: 'Almarai-Bold',
                fontSize: 17,
              ),
            )
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GalleryScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TextToSpeechScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SelectFontSizeScreen(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ListingLoadingScrollScreen(),
        ));
        break;
    }
  }
}
