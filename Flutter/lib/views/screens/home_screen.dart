import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/app_colors.dart';
import 'package:flutter_app/helpers/app_dimensions.dart';
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
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () => _openMenuScreen(context),
        //   )
        // ],
      ),
      drawer: NavigationDrawerWidget(),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
