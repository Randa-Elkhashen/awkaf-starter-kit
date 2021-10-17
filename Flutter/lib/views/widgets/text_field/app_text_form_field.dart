import 'dart:ui';
import 'package:flutter/material.dart';
class ATextFormField extends StatelessWidget {
  final TextInputType ?textInputType;
  final TextEditingController ?controller;
  final Widget ?prefixIcon;
  final Widget ?suffixIcon;
  final bool obscureText;
  final int? length;
  final String ?label;
  final String ?hint;
  final String ?errorMessage;
  final String ?initialValue;
  final TextAlign ?textAlign;
  final Function(String?) ?onSaved;
  final String? Function(String?) ?validator;
  final Function(String?) ?onChange;
  final TextInputAction? textInputAction;
  final VoidCallback? onAction;

  const ATextFormField({
    Key ?key,
    this.textInputType,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.textAlign,
    this.label,
    this.hint,
    this.errorMessage,
    this.onSaved,
    this.validator,
    this.onChange,
    this.initialValue,
    this.textInputAction,
    this.onAction, this.length
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onSaved: onSaved,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChange,
      style: Theme.of(context).textTheme.bodyText1,
      validator: validator,
      keyboardType: textInputType,
      controller: controller,
      obscureText: obscureText,
      maxLength: length,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: textInputType == TextInputType.multiline ? null : 1,
      textInputAction: textInputType == TextInputType.multiline
          ? null : textInputAction ?? TextInputAction.next,
      onEditingComplete: onAction ?? () => FocusScope.of(context).nextFocus(),
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
