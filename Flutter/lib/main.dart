import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/providers/news_provider.dart';
import 'package:flutter_app/providers/setting_provider.dart';
import 'package:flutter_app/providers/test_flow_provider.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/views/screens/splash_screen.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/style/app_themes.dart';
import 'package:flutter_app/views/view_helpers/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
      ChangeNotifierProvider(
        create: (_) => SettingProvider(),
        child: MyApp(),
      )
  );
  FlutterError.onError = (FlutterErrorDetails details) async {
    print('FlutterError: ${details.exception} - ${details.stack}');
    StackTrace stackTrace = details.stack != null ? details.stack! : StackTrace.empty;
    Zone.current.handleUncaughtError(details.exception, stackTrace);
  };
  runZonedGuarded<Future<void>>(() async {
    ChangeNotifierProvider(
      create: (_) => SettingProvider(),
      child: MyApp(),
    );
  }, (Object error, StackTrace stackTrace) {
    print('runZonedGuarded...... FlutterError: $stackTrace -}');
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _settingProvider = Provider.of<SettingProvider>(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TestFlowProvider()),
          ChangeNotifierProvider(create: (_) => NewsProvider()),
        ],
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: MaterialApp(
            title: 'FE Library',
            builder: (BuildContext context, Widget? child){
              AppStyle.setMedia(MediaQuery.maybeOf(context)!);
              return MediaQuery(
                  data: AppStyle.mediaQueryData!,
                  child: child!
              );
            },
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: _settingProvider.themeMode,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            onUnknownRoute: (_){

            },
            onGenerateRoute: Routes.onGenerateRoute,
          ),
        ));
  }
}
