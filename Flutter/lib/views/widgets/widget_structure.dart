import 'package:flutter/material.dart';
import 'package:flutter_app/app_helpers/app_logger.dart';

class WidgetStructure extends StatefulWidget {
  WidgetStructure({Key? key}) : super(key: key);

  @override
  State<WidgetStructure> createState() => _WidgetStructureState();
}

class _WidgetStructureState extends State<WidgetStructure> {
  // 1.
  late final ScrollController _ScrollController;
  //2.
  // ui actions
  Future<void> _getAllUsers() async {
    // await Provider.of<UsersProvider>(context, listen: false).getAllUsers();
  }
  // user actions
  Future<void> _onUserRefresh() async {
    // await Provider.of<UsersProvider>(context, listen: false).getAllUsers();
    AppLogger.logToConsole('_onUserRefresh');
  }

// 3.
  @override
  void initState() {
    super.initState();
    _ScrollController = ScrollController();
  }

  @override
  void dispose() {
    _ScrollController.dispose();
    super.dispose();
  }

  // 4.
  // build
  @override
  Widget build(BuildContext context) {
    // 5.
    // ui widget varibles
    var _appbarWidget = AppBar(title: Text("Widget Structure"), centerTitle: true);
    // 6.
    // return for build Widget
    return RefreshIndicator(
      onRefresh: () => _onUserRefresh(),
      child: Scaffold(
        appBar: _appbarWidget,
        body: Column(
          children: [
            _buildWidgetHeader(),
            SizedBox(height: 5),
            Expanded(
              child: ListView(
                controller: ScrollController(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 7.
  // Widget ui functions
  Widget _buildWidgetHeader() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      color: Colors.amber,
    );
  }
}
