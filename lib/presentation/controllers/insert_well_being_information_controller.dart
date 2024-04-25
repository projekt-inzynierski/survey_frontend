import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/life_satisfaction_dto.dart';
import 'package:survey_frontend/domain/models/quality_of_sleep_dto.dart';
import 'package:survey_frontend/domain/models/stress_level_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class InsertWellBeingInformationController extends ControllerBase{
  final RxList<LifeSatisfactionDto> lifeSatisfactionOptions = <LifeSatisfactionDto>[].obs;
  final RxList<StressLevelDto> stressLevelOptions = <StressLevelDto>[].obs;
  final RxList<QualityOfSleepDto> qualityOfSleepOptions = <QualityOfSleepDto>[].obs;


  Rx<LifeSatisfactionDto?> selectedLifeSatisfactionOption = Rx(null);
  Rx<StressLevelDto?> selectedStressLevelOption = Rx(null); 
  Rx<QualityOfSleepDto?> selectedQualityOfSleepOption = Rx(null); 

  final formKey = GlobalKey<FormState>();
  bool isBusy = false;

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
        await Get.offAllNamed("/home");
      }
    } catch (e){
      await handleSomethingWentWrong(e);
    }finally{
      isBusy = false;
    }
  }

  void fillDropdownsFromGet(){
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