import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText({Key? key, this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);

  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontFamily: 'Roboto',
          fontSize: size == 0 ? 20 : size
      ),
    );
  }
}