import 'package:flutter/material.dart';
import '../const/color.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.width,
    this.height,
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final String text;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height ?? 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: backgroundColor ?? AppColors.black,
          border: Border.all(
            color: borderColor ?? AppColors.dividerColor,
            width: 0.2,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: shadowColor ?? AppColors.transparent,
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: CustomText(
            text: text,
            color: AppColors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
