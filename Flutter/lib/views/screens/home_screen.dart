import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/tabs/auth/sign_in.dart';
import 'package:flutter_app/views/screens/tabs/date_time_screen.dart';
import 'package:flutter_app/views/screens/tabs/font_resizing_screen.dart';
import 'package:flutter_app/views/screens/tabs/gallery_screen.dart';
import 'package:flutter_app/views/screens/tabs/listing_loading_scroll_screen.dart';
import 'package:flutter_app/views/screens/tabs/news_screen.dart';
import 'package:flutter_app/views/screens/tabs/text_to_speech/text_to_speech_screen.dart';
import 'package:flutter_app/views/view_helpers/imports.dart';

import 'package:flutter_app/views/screens/drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _labels = const[
    "Gallery",
    "Text To Speech",
    "Font Resizing",
    "Listing",
    "Lazy Loading",
    "User Cycle",
    "Date and Time",
  ];
  @override
  Widget build(BuildContext context) {
    AppDimensions(context);
    return DefaultTabController(
      length: _labels.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("FB Library"),
          bottom: TabBar(
            indicatorColor: Theme.of(context).colorScheme.onPrimary,
            isScrollable: true,
            tabs: _labels.map((e) => Tab(text: e,)).toList()
          ),
          actions: [

          ],
        ),
        drawer: NavigationDrawerWidget(),
        body: TabBarView(
          children: [
            GalleryScreen(),
            TextToSpeechScreen(),
            SelectFontSizeScreen(),
            ListingLoadingScrollScreen(),
            NewsScreens(),
            SignInPage(),
            DateTimeScreen(),
          ]
        ),
      ),
    );
  }
}
