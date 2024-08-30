import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/core/usecases/need_insert_respondent_data_usecase.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/login_service.dart';
import 'package:survey_frontend/domain/external_services/respondent_date_service.dart';
import 'package:survey_frontend/domain/models/login_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:survey_frontend/presentation/functions/handle_need_insert_resondent_data.dart';


class LoginController extends ControllerBase{
  final Rx<LoginDto> model = LoginDto().obs;
  final formKey = GlobalKey<FormState>();
  final LoginService _loginService;
  final NeedInsertRespondentDataUseCase _needInsertRespondentDataUseCase;
  final GetStorage _storage;
  bool isBusy = false;
  bool _alwaysValidateInvalidCredentials = false;

  LoginController(
      this._loginService, 
      this._storage, 
      this._needInsertRespondentDataUseCase);

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
    const int maxPasswordLength = 255;

    if (_alwaysValidateInvalidCredentials){
      return AppLocalizations.of(Get.context!)!.invalidCredentials;
    }

    if (value == null || value == ''){
      return AppLocalizations.of(Get.context!)!.passwordNotEmpty;
    }

    if (value.length > maxPasswordLength) {
      return AppLocalizations.of(Get.context!)!
          .passwordTooLong(maxPasswordLength);
    }

    return null;
  }

  String? usernameValidator(String? value){
    const int maxUsernameLength = 255;

    if (_alwaysValidateInvalidCredentials){
      return AppLocalizations.of(Get.context!)!.invalidCredentials;
    }

    if (value == null || value == ''){
      return AppLocalizations.of(Get.context!)!.usernameNotEmpty;
    }

    if (value.length > maxUsernameLength) {
      return AppLocalizations.of(Get.context!)!
          .usernameTooLong(maxUsernameLength);
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
    var needInsertRespondentDataRes = await _needInsertRespondentDataUseCase.needInsertRespondentData(); 
    handle(needInsertRespondentDataRes);
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
