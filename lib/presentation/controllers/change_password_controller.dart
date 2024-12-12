import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class ChangePasswordController extends ControllerBase{
  final RxString currentPassword = ''.obs;
  final RxString newPassword = ''.obs;
  final RxString retypePassword = ''.obs;
  final formKey = GlobalKey<FormState>();

  void save(){}

  void clearData(){
    currentPassword.value = '';
    newPassword.value = '';
    retypePassword.value = '';
  }
}