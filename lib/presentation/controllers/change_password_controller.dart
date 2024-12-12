import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/l10n/get_localizations.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:survey_frontend/presentation/static/routes.dart';

class ChangePasswordController extends ControllerBase{
  final RxString currentPassword = ''.obs;
  final RxString newPassword = ''.obs;
  final RxString retypePassword = ''.obs;
  final formKey = GlobalKey<FormState>();

  void save(){
    final isValid = formKey.currentState!.validate();
      Get.focusScope!.unfocus();

      if (!isValid) {
        return;
      }
    Get.toNamed(Routes.changePasswordConfirmation);
  }

  void clearData(){
    currentPassword.value = '';
    newPassword.value = '';
    retypePassword.value = '';
  }

  String? validateCurrentPassword(String? value){
    if (value?.isEmpty ?? true){
      getAppLocalizations().currentPasswordMustNotBeEmpty;
    }

    return null;
  }

  String? validateNewPassword(String? value){
    if (value == null || value.length < 8){
      getAppLocalizations().minNewPasswordLenError;
    }

    return null;
  }

  String? validateRetypePassword(String? value){
    if (value != newPassword.value){
      return getAppLocalizations().retypePasswordMustBeEqualToNewPassword;
    }

    return null;
  }
}