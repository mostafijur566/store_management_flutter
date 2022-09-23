import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_management_flutter/widgets/big_text.dart';
import 'package:store_management_flutter/widgets/dashboard_button.dart';
import 'package:store_management_flutter/widgets/dashboard_button_mobile.dart';

import '../utils/app_colors.dart';
import 'dart:io';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: _selectPlatform(),
    );
  }

  Widget _selectPlatform(){
    if(Platform.isAndroid || Platform.isIOS){
      bgColor = Colors.white;
      return _mobile();
    }
    else{
      bgColor = AppColors.backgroundColor;
      return _desktop();
    }
  }

  Widget _mobile(){
    return SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04, bottom: MediaQuery.of(context).size.width * 0.04, left: MediaQuery.of(context).size.width * 0.045, right: MediaQuery.of(context).size.width * 0.045),
              width: double.infinity,
              color: AppColors.mainColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/logo.jpg', width: 24,),
                      SizedBox(width: 10,),
                      BigText(text: 'Dashboard', color: Colors.white,),
                    ],
                  ),
                  Row(children: [
                    Icon(FontAwesomeIcons.user, color: Colors.white,),
                    SizedBox(width: 20,),
                    Icon(FontAwesomeIcons.rightFromBracket, color: Colors.white,),
                  ],)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: [
                  BigText(text: 'Dashboard Statistics'),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DashBoardButtonMobile(title: 'Staff', icon: FontAwesomeIcons.users, value: '7',),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                      DashBoardButtonMobile(title: 'Product', icon: FontAwesomeIcons.box, value: '7',)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DashBoardButtonMobile(title: 'Customer', icon: FontAwesomeIcons.users, value: '7',),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                      DashBoardButtonMobile(title: 'Billing', icon: FontAwesomeIcons.fileInvoiceDollar, value: '7',)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DashBoardButtonMobile(title: 'Billing History', icon: FontAwesomeIcons.fileInvoiceDollar, value: '7',),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                      DashBoardButtonMobile(title: 'Sales', icon: FontAwesomeIcons.chartColumn, value: '7',)
                    ],
                  ),

                ],
              ),
            )
          ],
        )
    );
  }

  Widget _desktop(){
    return Column(
      children: [
        //Appbar
        Container(
          width: double.infinity,
          color: AppColors.mainColor,
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/logo.jpg', width: 30,),
                  SizedBox(width: 10,),
                  BigText(text: 'Dashboard', color: Colors.white,),
                ],
              ),
              Row(
                children: [
                  BigText(text: 'Profile', color: Colors.white,),
                  SizedBox(width: 10,),
                  BigText(text: 'Logout', color: Colors.white,),
                  Icon(Icons.logout_outlined, color: Colors.white,)
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 950,
          margin: EdgeInsets.only(top: 20,),
          padding: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(0,0),
                    color: Colors.grey.withOpacity(0.4)
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, top: 5, bottom: 5, left: 20),
                width: double.infinity,
                color: AppColors.mainColor,
                child: BigText(text: 'Dashboard Statistics', color: Colors.white,),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashboardButton(title: 'Staff', icon: FontAwesomeIcons.users, value: '7',),
                  SizedBox(width: 20,),
                  DashboardButton(title: 'Product', icon: FontAwesomeIcons.box, value: '7',),
                  SizedBox(width: 20,),
                  DashboardButton(title: 'Customer', icon: FontAwesomeIcons.users, value: '7',),
                  SizedBox(width: 20,),
                  DashboardButton(title: 'Billing', icon: FontAwesomeIcons.fileInvoiceDollar, value: '7',),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashboardButton(title: 'Billing History', icon: FontAwesomeIcons.fileInvoiceDollar, value: '7',),
                  SizedBox(width: 20,),
                  DashboardButton(title: 'Sales', icon: FontAwesomeIcons.chartColumn, value: '7',),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
