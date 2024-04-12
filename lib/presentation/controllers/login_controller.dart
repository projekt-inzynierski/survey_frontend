import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/data/models/login_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class LoginController extends ControllerBase{
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
        await Get.offNamed("/insertdemograficinformation");
      }
    } catch (e){
      await handleSomethingWentWrong(e);
    } finally{
      isBusy = false;
    }
  }

  String? passwordValidator(String? value){
    if (value == null || value == ''){
      return 'Password must not be empty';
    }

    if (value.length > 255){
      return 'Password must not be longer than 255 characters';
    }

    return null;
  }

  String? usernameValidator(String? value){
    if (value == null || value == ''){
      return 'Username must not be empty';
    }

    if (value.length > 255){
      return 'Username must not be longer than 255 characters';
    }

    return null;
  }
}