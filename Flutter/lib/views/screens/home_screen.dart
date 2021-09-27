import 'package:flutter/material.dart';
import 'package:flutter_app/views/view_helpers/imports.dart';

import 'package:flutter_app/views/screens/drawer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimensions(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.orange,
      ),
      drawer: NavigationDrawerWidget(),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
