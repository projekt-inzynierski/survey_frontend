import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/domain/external_services/respondent_date_service.dart';
import 'package:survey_frontend/domain/models/create_respondent_data_dto.dart';
import 'package:survey_frontend/domain/models/life_satisfaction_dto.dart';
import 'package:survey_frontend/domain/models/quality_of_sleep_dto.dart';
import 'package:survey_frontend/domain/models/stress_level_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class InsertWellBeingInformationController extends ControllerBase{
  final RespondentDataService _respondentDataService;
  final GetStorage _storage;

  final RxList<LifeSatisfactionDto> lifeSatisfactionOptions = <LifeSatisfactionDto>[].obs;
  final RxList<StressLevelDto> stressLevelOptions = <StressLevelDto>[].obs;
  final RxList<QualityOfSleepDto> qualityOfSleepOptions = <QualityOfSleepDto>[].obs;

  CreateRespondentDataDto? createRespondentDataDto;

  final formKey = GlobalKey<FormState>();
  bool isBusy = false;

  InsertWellBeingInformationController(this._respondentDataService, this._storage);

  String? validateNotEmpty(Object? value){
    if (value == null){
      return "Value must not be empty";
    }
    return null;
  }

  void next() async{
    if (isBusy){
      return;
    }

    try{
      isBusy = true;
      final isValid = formKey.currentState!.validate();
      Get.focusScope!.unfocus();

      if (isValid) {
        formKey.currentState!.save();
        await saveAndGoHome();
      }
    } catch (e){
      await handleSomethingWentWrong(e);
    }finally{
      isBusy = false;
    }
  }

  Future saveAndGoHome() async{
    var result = await _respondentDataService.create(createRespondentDataDto!);

    if (result.error != null || result.statusCode != 201){
      await handleSomethingWentWrong(null);
      return;
    }

    _storage.write('respondentData', result.body!);
    await Get.offAllNamed("/home");
  }

  void fillDropdownsFromGet(){
    createRespondentDataDto ??= Get.arguments['dto'];

    if (lifeSatisfactionOptions.isEmpty){
      lifeSatisfactionOptions
        .addAll(Get.arguments['lifeSatisfactions']);
    }

    if (stressLevelOptions.isEmpty){
      stressLevelOptions
        .addAll(Get.arguments['stressLevels']);
    }

    if (qualityOfSleepOptions.isEmpty){
      qualityOfSleepOptions
        .addAll(Get.arguments['qualityOfSleeps']);
    }
  }
}