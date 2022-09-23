import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_management_flutter/widgets/input_field.dart';

import '../../utils/app_colors.dart';
import '../../widgets/big_text.dart';

class AddStaffMobile extends StatefulWidget {
  const AddStaffMobile({Key? key}) : super(key: key);

  @override
  State<AddStaffMobile> createState() => _AddStaffMobileState();
}

class _AddStaffMobileState extends State<AddStaffMobile> {
  String accountType = "admin";
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    Image.asset('assets/images/logo.jpg', width: 24,),
                    SizedBox(width: 10,),
                    BigText(text: 'Add Account', color: Colors.white,),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Icon(FontAwesomeIcons.userPlus, size: 50,),
              MyInputField(title: 'Email', hint: 'email'),
              MyInputField(title: 'Username', hint: 'username'),
              MyInputField(title: 'NID', hint: 'nid no'),
              MyInputField(title: 'Contact', hint: 'contact no'),
              MyInputField(title: 'Address', hint: 'address'),
              MyInputField(title: 'Password', hint: 'password'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                      activeColor: AppColors.mainColor,
                      value: 0,
                      groupValue: _value,
                      onChanged: (value){
                        setState(() {
                          _value = int.parse(value.toString());
                          accountType = 'admin';
                        });
                      }
                  ),
                  BigText(text: 'Admin'),
                  Radio(
                      activeColor: AppColors.mainColor,
                      value: 1,
                      groupValue: _value,
                      onChanged: (value){
                        setState(() {
                          _value = int.parse(value.toString());
                          accountType = 'staff';
                        });
                      }
                  ),
                  BigText(text: 'Staff'),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.mainColor,
                ),
                child: Center(child: BigText(text: 'Create Account', color: Colors.white,)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
