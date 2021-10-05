import 'package:flutter/material.dart';
import 'package:flutter_app/providers/setting_provider.dart';
import 'package:flutter_app/views/screens/tabs/auth/sign_in.dart';
import 'package:flutter_app/views/screens/tabs/date_time_screen.dart';
import 'package:flutter_app/views/screens/tabs/font_resizing_screen.dart';
import 'package:flutter_app/views/screens/tabs/maps_screen.dart';
import 'package:flutter_app/views/screens/tabs/presentation/gallery_screen.dart';
import 'package:flutter_app/views/screens/tabs/listing_loading_scroll_screen.dart';
import 'package:flutter_app/views/screens/tabs/news_screen.dart';
import 'package:flutter_app/views/screens/tabs/presentation/presentation_screen.dart';
import 'package:flutter_app/views/screens/tabs/text_to_speech/text_to_speech_form_widget_screen.dart';
import 'package:flutter_app/views/screens/tabs/text_to_speech/text_to_speech_screen.dart';
import 'package:flutter_app/views/view_helpers/imports.dart';

import 'package:flutter_app/views/screens/drawer_screen.dart';
import 'package:flutter_app/views/widgets/buttons/app_icon_button.dart';
import 'package:provider/provider.dart';

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
    "Maps",
  ];
  @override
  Widget build(BuildContext context) {
    final _settingProvider = Provider.of<SettingProvider>(context,listen: false);
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
            AppIconButton(
                iconData:  _settingProvider.themeMode?.index == 0
                    ? Icons.settings_suggest_outlined :
                _settingProvider.themeMode?.index == 1
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
              onPressed: (){
                _settingProvider.setThemeMode(
                    ThemeMode.values[
                    ((_settingProvider.themeMode?.index ?? 0) + 1) % 3]
                );
              },
            )
          ],
        ),
        drawer: NavigationDrawerWidget(),
        body: TabBarView(
          children: [
            PresentationScreen(),
            TextToSpeechFromWidgetScreen(),
            SelectFontSizeScreen(),
            ListingLoadingScrollScreen(),
            NewsScreens(),
            SignInPage(),
            DateTimeScreen(),
            MapsScreen(),
          ]
        ),
      ),
    );
  }
}
