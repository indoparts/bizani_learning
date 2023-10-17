import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextApps extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight stylefont;
  final TextAlign align;
  const TextApps(
      {super.key,
      required this.text,
      required this.size,
      required this.stylefont,
      required this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size.sp, fontWeight: stylefont),
      textAlign: align,
    );
  }
}
