import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/login_service.dart';
import 'package:survey_frontend/domain/models/login_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class LoginController extends ControllerBase{
  final Rx<LoginDto> model = LoginDto().obs;
  final formKey = GlobalKey<FormState>();
  final LoginService _loginService;
  final GetStorage _storage;
  bool isBusy = false;
  bool _alwaysValidateInvalidCredentials = false;

  LoginController(this._loginService, this._storage);

  void login() async{
    if (isBusy){
      return;
    }

    try{
      isBusy = true;
      final isValid = formKey.currentState!.validate();
      Get.focusScope!.unfocus();

      if (!isValid) {
        return;
      }

      formKey.currentState!.save();

      if (!await hasInternetConnection()) {
        return;
      }

      var apiResponse = await _loginService.login(model.value);
      await handleAPIResponse(apiResponse);
    } catch (e){
      await handleSomethingWentWrong(e);
    } finally{
      isBusy = false;
    }
  }

  String? passwordValidator(String? value){
    if (_alwaysValidateInvalidCredentials){
      return 'Invalid credentials';
    }

    if (value == null || value == ''){
      return 'Password must not be empty';
    }

    if (value.length > 255){
      return 'Password must not be longer than 255 characters';
    }

    return null;
  }

  String? usernameValidator(String? value){
    if (_alwaysValidateInvalidCredentials){
      return 'Invalid credentials';
    }

    if (value == null || value == ''){
      return 'Username must not be empty';
    }

    if (value.length > 255){
      return 'Username must not be longer than 255 characters';
    }

    return null;
  }
  
  Future handleAPIResponse(APIResponse<String> apiResponse) async{
    if (apiResponse.error != null){
      await handleSomethingWentWrong(apiResponse.error!);
      return;
    }

    if (apiResponse.statusCode == 401){
      showInvalidCredentialsError();
      return;
    }

    if (apiResponse.statusCode != 200){
      await handleSomethingWentWrong(apiResponse.error!);
      return;
    }
    saveToken(apiResponse.body!);
    await Get.offNamed("/welcome");
  }
  
  void showInvalidCredentialsError() {
    try{
      _alwaysValidateInvalidCredentials = true;
      formKey.currentState!.validate();
      Get.focusScope!.unfocus();
    } finally{
      _alwaysValidateInvalidCredentials = false;
    }
  }
  
  void saveToken(String token) {
    _storage.write('apiToken', token);
  }
}