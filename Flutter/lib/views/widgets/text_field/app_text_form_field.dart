import 'dart:ui';
import 'package:flutter/material.dart';

class ATextFormField extends StatelessWidget {
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final String? initialValue;
  final TextAlign? textAlign;
  final double? width;
  final bool readOnly;
  final int? maxLength;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function(String?)? onChange;
  final Function()? onTap;

  const ATextFormField({
    Key? key,
    this.textInputType,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.width,
    this.textAlign,
    this.label,
    this.hint,
    this.errorMessage,
    this.readOnly = false,
    this.maxLength,
    this.onSaved,
    this.validator,
    this.onChange,
    this.onTap,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onSaved: onSaved,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChange,
      onTap: onTap,
      style: Theme.of(context).textTheme.bodyText1,
      validator: validator,
      keyboardType: textInputType,
      readOnly: readOnly,
      controller: controller,
      obscureText: obscureText,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: textInputType == TextInputType.multiline ? null : 1,
      maxLength: maxLength,
      decoration: InputDecoration(
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        labelText: label,
        hintText: hint,
        fillColor: Theme.of(context).colorScheme.background,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorText: errorMessage,
      ),
    );
  }
}
