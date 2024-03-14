// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../const/color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintText;
  final Widget? suffixWidget;
  final bool? obscureText;
  final bool? autofocus;

  const CustomTextField({
    Key? key,
    this.textEditingController,
    this.hintText,
    this.suffixWidget,
    this.obscureText,
    this.autofocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.lightGreen,
      style: const TextStyle(color: AppColors.textColor2),
      controller: textEditingController,
      obscureText: obscureText ?? false,
      autofocus: autofocus ?? false,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: suffixWidget,
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 20, maxHeight: 20),
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.textColor2, fontWeight: FontWeight.w400, fontSize: 16.0),
      ),
    );
  }
}
