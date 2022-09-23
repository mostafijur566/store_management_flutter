import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'big_text.dart';

class DashBoardButtonMobile extends StatelessWidget {
  DashBoardButtonMobile({Key? key, required this.title, this.value, required this.icon}) : super(key: key);

  final String title;
  final IconData icon;
  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.09, bottom: MediaQuery.of(context).size.width * 0.09),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(5,5),
                color: Colors.grey.withOpacity(0.4)
            )
          ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigText(text: title),
              Icon(icon)
            ],
          ),
          value == null ? Container() : BigText(text: value!)
        ],
      ),
    );
  }
}
