import 'package:flutter/material.dart';
class ATextButton extends StatelessWidget {
  final Color? color;
  final String text;
  final VoidCallback? onPressed;

  const ATextButton({
    Key? key,
    this.color,
    required this.text,
    this.onPressed
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
              vertical: 16
          ),
          primary: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)
          ),
        ),
        child: Text(
          text,
        ),
        onPressed: onPressed
    );
  }
}
