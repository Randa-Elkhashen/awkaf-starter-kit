import 'package:flutter/material.dart';
class AIconButton extends StatelessWidget {
  final IconData iconData;
  final Color? color;
  final VoidCallback? onPressed;

  const AIconButton({
    Key? key,
    required this.iconData,
    this.onPressed, this.color
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return IconButton(
      onPressed: onPressed,
      color: color,
      icon: Icon(iconData),
    );
  }
}
