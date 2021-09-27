import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/providers/test_flow_provider.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/views/screens/home_screen.dart';
import 'package:flutter_app/views/screens/test_flow_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
  FlutterError.onError = (FlutterErrorDetails details) async {
    print('FlutterError: ${details.exception} - ${details.stack}');
    StackTrace stackTrace = details.stack != null ? details.stack! : StackTrace.empty;
    Zone.current.handleUncaughtError(details.exception, stackTrace);
  };
  runZonedGuarded<Future<void>>(() async {
    runApp(MyApp());
  }, (Object error, StackTrace stackTrace) {
    print('runZonedGuarded...... FlutterError: ${stackTrace} -}');
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TestFlowProvider()),
        ],
        child: MaterialApp(
          title: 'TurnDigital',
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          onGenerateRoute: Routes.onGenerateRoute,
        ));
  }
}
