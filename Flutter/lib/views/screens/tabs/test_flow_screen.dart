import 'package:flutter/material.dart';
import 'package:flutter_app/providers/test_flow_provider.dart';
import 'package:provider/provider.dart';

class TestFlowScreen extends StatelessWidget {
  const TestFlowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _testFlowProvider = Provider.of<TestFlowProvider>(context, listen: false);
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        child: Text("GET"),
        onPressed: () => _testFlowProvider.getTrendingNews(),
      ),
    ));
  }
}
