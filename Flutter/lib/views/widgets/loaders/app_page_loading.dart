
import 'package:flutter/material.dart';
import 'package:flutter_app/views/style/app_style.dart';

class APageLoading extends StatelessWidget {
  const APageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppStyle.size.width / 1.2,
        height: AppStyle.size.height / 24,
        child: const LinearProgressIndicator(),
      ),
    );
  }
}
