import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_colors.dart';
import '../../widgets/account_widget.dart';
import '../../widgets/account_widget_desktop.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import 'dart:io';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _selectPlatform(),
      ),
    );
  }

  Widget _selectPlatform(){
    if(Platform.isAndroid || Platform.isIOS){
      return _mobile();
    }
    else{
      return _desktop();
    }
  }

  Widget _mobile(){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04, bottom: MediaQuery.of(context).size.width * 0.04, left: MediaQuery.of(context).size.width * 0.045, right: MediaQuery.of(context).size.width * 0.045),
            width: double.infinity,
            color: AppColors.mainColor,
            child: Row(
              children: [
                Icon(FontAwesomeIcons.angleLeft, color: Colors.white,),
                SizedBox(width: 10,),
                SizedBox(width: 10,),
                BigText(text: 'Profile', color: Colors.white,),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Icon(FontAwesomeIcons.user, size: 50,),
          SizedBox(height: 20,),
          AccountWidget(
            appIcon: AppIcon(
              icon: FontAwesomeIcons.user,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: 25,
              size: 10 * 5,
            ),
            bigText: BigText(
              text: 'Mostafijur Rahman',
            ),
          ),
          SizedBox(height: 5,),
          AccountWidget(
            appIcon: AppIcon(
              icon:FontAwesomeIcons.envelope,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: 25,
              size: 10 * 5,
            ),
            bigText: BigText(
              text: 'mostafijur1812@gmail.com',
            ),
          ),
          SizedBox(height: 5,),
          AccountWidget(
            appIcon: AppIcon(
              icon:FontAwesomeIcons.user,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: 25,
              size: 10 * 5,
            ),
            bigText: BigText(
              text: 'mosta',
            ),
          ),
          SizedBox(height: 5,),
          AccountWidget(
            appIcon: AppIcon(
              icon: FontAwesomeIcons.addressCard,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: 25,
              size: 10 * 5,
            ),
            bigText: BigText(
              text: '5644599875',
            ),
          ),
          SizedBox(height: 5,),
          AccountWidget(
            appIcon: AppIcon(
              icon: FontAwesomeIcons.phone,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: 25,
              size: 10 * 5,
            ),
            bigText: BigText(
              text: '01757261840',
            ),
          ),
          SizedBox(height: 5,),
          AccountWidget(
            appIcon: AppIcon(
              icon: FontAwesomeIcons.locationDot,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: 25,
              size: 10 * 5,
            ),
            bigText: BigText(
              text: 'CUFL',
            ),
          ),
        ],
      ),
    );
  }

  Widget _desktop(){
    return Column(
      children: [
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
                  BigText(text: 'Logout', color: Colors.white,),
                  Icon(Icons.logout_outlined, color: Colors.white,)
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 20,),
        Icon(FontAwesomeIcons.user, size: 70,),
        SizedBox(height: 20,),
        AccountWidgetDesktop(
          appIcon: AppIcon(
            icon: FontAwesomeIcons.user,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: 25,
            size: 10 * 5,
          ),
          bigText: BigText(
            text: 'Mostafijur Rahman',
          ),
        ),
        SizedBox(height: 5,),
        AccountWidgetDesktop(
          appIcon: AppIcon(
            icon:FontAwesomeIcons.envelope,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: 25,
            size: 10 * 5,
          ),
          bigText: BigText(
            text: 'mostafijur1812@gmail.com',
          ),
        ),
        SizedBox(height: 5,),
        AccountWidgetDesktop(
          appIcon: AppIcon(
            icon:FontAwesomeIcons.user,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: 25,
            size: 10 * 5,
          ),
          bigText: BigText(
            text: 'mosta',
          ),
        ),
        SizedBox(height: 5,),
        AccountWidgetDesktop(
          appIcon: AppIcon(
            icon: FontAwesomeIcons.addressCard,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: 25,
            size: 10 * 5,
          ),
          bigText: BigText(
            text: '5644599875',
          ),
        ),
        SizedBox(height: 5,),
        AccountWidgetDesktop(
          appIcon: AppIcon(
            icon: FontAwesomeIcons.phone,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: 25,
            size: 10 * 5,
          ),
          bigText: BigText(
            text: '01757261840',
          ),
        ),
        SizedBox(height: 5,),
        AccountWidgetDesktop(
          appIcon: AppIcon(
            icon: FontAwesomeIcons.locationDot,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: 25,
            size: 10 * 5,
          ),
          bigText: BigText(
            text: 'CUFL',
          ),
        ),
      ],
    );
  }
}
