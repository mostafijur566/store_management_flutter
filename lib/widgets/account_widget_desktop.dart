import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_icon.dart';
import 'big_text.dart';


class AccountWidgetDesktop extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  AccountWidgetDesktop({Key? key, required this.appIcon,
    required this.bigText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: EdgeInsets.only(left: 20,
          top: 10,
          bottom: 10
      ),

      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 2
            ),
          ]
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: 20,),
          bigText
        ],
      ),
    );
  }
}