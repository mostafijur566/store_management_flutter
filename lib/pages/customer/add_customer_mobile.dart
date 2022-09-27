import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/input_field.dart';

class AddCustomerMobile extends StatefulWidget {
  const AddCustomerMobile({Key? key}) : super(key: key);

  @override
  State<AddCustomerMobile> createState() => _AddCustomerMobileState();
}

class _AddCustomerMobileState extends State<AddCustomerMobile> {
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
                    SizedBox(width: 10,),
                    BigText(text: 'Add Customer', color: Colors.white,),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Icon(FontAwesomeIcons.userPlus, size: 50,),
              MyInputField(title: 'Name', hint: 'full name'),
              MyInputField(title: 'Contact', hint: 'contact no'),
              MyInputField(title: 'Address', hint: 'address'),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.mainColor,
                ),
                child: Center(child: BigText(text: 'Add', color: Colors.white,)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
