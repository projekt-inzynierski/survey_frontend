import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/data/models/login_dto.dart';

class LoginController extends GetxController{
  final Rx<LoginDto> model = LoginDto().obs;
  final formKey = GlobalKey<FormState>();
  bool isBusy = false;

  void login() async{
    if (isBusy){
      return;
    }

    try{
      isBusy = true;
      final isValid = formKey.currentState!.validate();
      Get.focusScope!.unfocus();

      if (isValid) {
        formKey.currentState!.save();
        await Get.offNamed("/home");
      }
    } catch (e){
      await Get.defaultDialog(
        title: "Error",
        middleText: "Something went wrong. Try again later",
      );
    } finally{
      isBusy = false;
    }
  }

  String? passwordValidator(String? value){
    if (value == null || value == ''){
      return 'Password must not be empty';
    }
    return null;
  }

  String? usernameValidator(String? value){
    if (value == null || value == ''){
      return 'Username must not be empty';
    }
    return null;
  }
}