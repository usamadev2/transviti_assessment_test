import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize,
    this.maxLine,
    this.textAlign,
    this.fontWeight,
    this.style,
    this.onTap,
    this.color,
  }) : super(key: key);

  final String text;
  final int? maxLine;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        maxLines: maxLine,
        overflow: TextOverflow.visible,
        textAlign: textAlign,
        style: style ??
            TextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
      ),
    );
  }
}
