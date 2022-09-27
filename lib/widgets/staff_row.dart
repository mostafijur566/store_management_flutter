import 'package:flutter/material.dart';

import 'big_text.dart';

class StaffRow extends StatelessWidget {
  StaffRow({Key? key, this.title, this.color = Colors.white, this.size}) : super(key: key);
  String? title;
  Color? color;
  double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.14,
      child: Center(
          child: BigText(
            text: title == null ? "" : title!,
            color: color,
            size: size == null ? 16 : size!,
          ),
      ),
    );
  }
}
