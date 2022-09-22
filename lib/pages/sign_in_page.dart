import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:store_management_flutter/utils/app_colors.dart';
import 'package:store_management_flutter/widgets/input_field.dart';

import '../widgets/app_text_field.dart';
import '../widgets/big_text.dart';
import '../widgets/button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Color? bgColor;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bgColor,

      body: _selectPlatform(context),
    );
  }

  _selectPlatform(BuildContext context){
    if(Platform.isAndroid || Platform.isIOS){
      bgColor = Colors.white;
      return _mobile(context);
    }
    else{
      bgColor = AppColors.backgroundColor;
      return _desktop();
    }
  }

  _mobile(BuildContext context){
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Hero(
                tag: 'logo',
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Center(
                      child: Image.asset('assets/images/logo.jpg',
                        width: 120,
                      )
                  ),
                ),
              ),

              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello',
                      style: TextStyle(
                          fontSize: 20 * 3 + 20 / 2,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    Text('Log into your account',
                      style: TextStyle(
                          fontSize: 20 ,
                          color: Colors.grey[500]
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                emailController: emailController,
                hintText: 'Email',
                icon: Icons.email,
              ),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                emailController: passwordController,
                hintText: 'Password',
                icon: Icons.password_sharp,
                hideText: true,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.mainColor),
                child: Center(
                  child: BigText(
                    text: 'Log In',
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
  _desktop(){
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        height: 400,
        child: Column(
          children: [
            Text('Store Management', style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20,),
            MyInputField(title: 'Email', hint: 'Enter your email'),
            MyInputField(title: 'Password', hint: 'Enter your password', hideText: true,),
            SizedBox(height: 20,),
            Button(title: "Log In",)
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
      ),
    );
  }
}

