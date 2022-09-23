import 'package:flutter/material.dart';

import 'big_text.dart';

class DashboardButton extends StatelessWidget {
  DashboardButton({Key? key, required this.title, this.value, required this.icon}) : super(key: key);

  final String title;
  String? value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.only(top: 25, bottom: 25, ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(0,0),
                color: Colors.grey.withOpacity(0.4)
            )
          ]
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(text: title),
                Icon(icon)
              ],

            ),
            value == null ? Container() : BigText(text: value!),
          ],
        ),
      ),
    );
  }
}
