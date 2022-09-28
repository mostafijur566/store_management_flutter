import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../data/repository/auth_repo.dart';

import '../models/response_model.dart';
import '../models/sign_in_body_model.dart';
import '../models/sign_up_body_model.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async{
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      if(response.body["status"] == 400){
        responseModel = ResponseModel(false, response.body["message"]);
        Get.snackbar('Error!', response.body["message"].toString(),
            colorText: Colors.white,
            backgroundColor: Colors.redAccent);
      }
      else{
        authRepo.saveUserToken(response.body["token"]);
        responseModel = ResponseModel(true, response.body["message"]);
      }
    }
    else{
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading=false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(SignInBody signInBody) async{
    _isLoading = true;
    update();
    Response response = await authRepo.login(signInBody);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, "success");
    }
    else{
      responseModel = ResponseModel(false, "Unable to log in with provided credentials.");
      if(Platform.isAndroid || Platform.isIOS){
        Get.snackbar('Error!', "Unable to log in with provided credentials.",
            icon: Icon(FontAwesomeIcons.triangleExclamation, color: Colors.white,),
            colorText: Colors.white,
            backgroundColor: Colors.redAccent
        );
      }
      else{
        Get.snackbar('Error!', "Unable to log in with provided credentials.",
            icon: Icon(FontAwesomeIcons.triangleExclamation, color: Colors.white,),
            maxWidth: 450,
            colorText: Colors.white,
            backgroundColor: Colors.redAccent
        );
      }


    }
    _isLoading=false;
    update();
    return responseModel;
  }

  Future <void> loggedInUser() async{
    String token;
    token = await authRepo.getUserToken();
    authRepo.saveUserToken(token);
  }

  void saveEmailAndPassword(String email, String password){
    authRepo.saveEmailAndPassowrd(email, password);
  }

  bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }

  Future<void> clearToken() async{
    await authRepo.clearToken();
  }


}