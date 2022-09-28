import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_management_flutter/pages/dashboard_page.dart';
import 'package:store_management_flutter/utils/app_colors.dart';
import 'package:store_management_flutter/widgets/input_field.dart';

import '../controller/auth_controller.dart';
import '../models/sign_in_body_model.dart';
import '../widgets/app_text_field.dart';
import '../widgets/big_text.dart';
import '../widgets/button.dart';
import 'package:get/get.dart';
import 'package:store_management_flutter/helper/dependencies.dart' as dep;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Color? bgColor;

  void _login(AuthController authController) async{

    String email = emailController.text.toLowerCase().trim();
    String password = passwordController.text;
    final bool isValid = EmailValidator.validate(email);
    if (email.isEmpty) {
      Get.snackbar(
        'Required!',
        'Email field cannot be empty!',
        icon: Icon(FontAwesomeIcons.triangleExclamation, color: Colors.white,),
        maxWidth: 450,
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (!isValid) {
      Get.snackbar(
        'Invalid!',
        'Please enter a valid email address!',
        icon: Icon(FontAwesomeIcons.triangleExclamation, color: Colors.white,),
        maxWidth: 450,
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (password.isEmpty) {
      Get.snackbar(
        'Required!',
        'Password field cannot be empty!',
        icon: Icon(FontAwesomeIcons.triangleExclamation, color: Colors.white,),
        maxWidth: 450,
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }


    else{
      SignInBody signInBody = SignInBody(username: email, password: password);
      authController.login(signInBody).then((status)  async{
        if(status.isSuccess){
          await dep.init();
          Get.off(DashboardPage());
        }
        else{
        }
      });
    }
  }

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

  Widget _mobile(BuildContext context){
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
              SizedBox(height: 30,),
              BigText(text: 'Powered by Mostafijur Rahman', size: 16, color: Colors.grey[700],)
            ],
          ),
        )
    );
  }
  Widget _desktop(){
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: GetBuilder<AuthController>(builder: (_authController){
        return ModalProgressHUD(
            inAsyncCall: _authController.isLoading,
            child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                height: 400,
                child: Column(
                  children: [
                    Text('Store Management', style: TextStyle(
                        fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(height: 20,),
                    MyInputField(title: 'Email', hint: 'Enter your email', controller: emailController,),
                    MyInputField(title: 'Password', hint: 'Enter your password', hideText: true,controller: passwordController,),
                    SizedBox(height: 20,),
                    GestureDetector(

                      onTap: (){
                        _login(_authController);
                      },
                      child: Button(
                        title: "Log In",
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 10,
                        offset: Offset(0,0),
                        color: Colors.grey.withOpacity(0.4),
                      )
                    ]
                ),
              ),
            ),
            SizedBox(height: 20,),
            BigText(text: 'Powered by Mostafijur Rahman', size: 16, color: Colors.grey[700],)
          ],
        ));
      },),
    );
  }
}

