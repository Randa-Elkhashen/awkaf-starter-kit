
import 'package:flutter/material.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/widgets/buttons/app_button.dart';
class NoItemFound extends StatelessWidget {
  final String ?message;
  final String ?buttonText;
  final VoidCallback ?onAddItem;
  const NoItemFound({
    Key ?key,
    this.message,
    this.buttonText,
    this.onAddItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size =  AppStyle.size.width/ 1.5;
    return Stack(
      fit: StackFit.expand,
      children: [
        ListView(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Image(
                width:  size,
                image: const AssetImage("assets/images/no_item_found.png"),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            Text(
                message ?? "no item found",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            onAddItem == null ? const SizedBox.shrink() :
            Column(
              children: [
                const SizedBox(height: 8),
                SizedBox(
                  width: size,
                  child: AppButton(
                    text: buttonText ?? "Add",
                    onPressed: onAddItem!,
                  ),
                ),
              ],
            ),
            const Spacer(flex: 1,),
          ],
        ),
      ],
    );
  }
}
