import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/life_satisfaction_service.dart';
import 'package:survey_frontend/domain/external_services/quality_of_sleep_service.dart';
import 'package:survey_frontend/domain/external_services/stress_level_service.dart';
import 'package:survey_frontend/domain/models/health_condition_dto.dart';
import 'package:survey_frontend/domain/models/life_satisfaction_dto.dart';
import 'package:survey_frontend/domain/models/medication_use_dto.dart';
import 'package:survey_frontend/domain/models/quality_of_sleep_dto.dart';
import 'package:survey_frontend/domain/models/stress_level_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class InsertHealthStatusInformationController  extends ControllerBase{
  final LifeSatisfactionService _lifeSatisfactionService;
  final StressLevelService _stressLevelService;
  final QualityOfSleepService _qualityOfSleepService;

  final RxList<HealthConditionDto> healthConditionOptions = <HealthConditionDto>[].obs;
  final RxList<MedicationUseDto> medicationUseOptions = <MedicationUseDto>[].obs;

  Rx<HealthConditionDto?> selectedHealthConditionOption = Rx(null);
  Rx<MedicationUseDto?> selectedMedicationUseOption = Rx(null); 

  final formKey = GlobalKey<FormState>();
  bool isBusy = false;

  InsertHealthStatusInformationController(this._lifeSatisfactionService, 
  this._stressLevelService, 
  this._qualityOfSleepService);

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

      if (!isValid) {
        return;
      }

      formKey.currentState!.save();
      await _loadDropdownsAndNext();
    } catch (e){
      await handleSomethingWentWrong(e);
    }finally{
      isBusy = false;
    }
  }

  Future _loadDropdownsAndNext() async{
    Future<APIResponse<List<LifeSatisfactionDto>>> lifeSatisfactionFuture = _lifeSatisfactionService.getLifeSatisfactions();
    Future<APIResponse<List<StressLevelDto>>> stressLevelsFuture = _stressLevelService.getStressLevels();
    Future<APIResponse<List<QualityOfSleepDto>>> qualityOfSleepFuture =   _qualityOfSleepService.getQualityOfSleeps();

    await Future.wait([
      lifeSatisfactionFuture, 
      stressLevelsFuture,
      qualityOfSleepFuture
      ]);

      APIResponse<List<LifeSatisfactionDto>> lifeSatisfactionResult = await lifeSatisfactionFuture;
      APIResponse<List<StressLevelDto>> stressLevelsResult = await stressLevelsFuture;
      APIResponse<List<QualityOfSleepDto>> qualityOfSleepResult = await qualityOfSleepFuture;

      if (lifeSatisfactionResult.error != null || lifeSatisfactionResult.statusCode != 200
      || stressLevelsResult.error != null || stressLevelsResult.statusCode != 200
      || qualityOfSleepResult.error != null || qualityOfSleepResult.statusCode != 200){
        await handleSomethingWentWrong(null);
        return;
      }


      await Get.toNamed("/insertwellbeinginformation",
      arguments: {
        'lifeSatisfactions': lifeSatisfactionResult.body!,
        'stressLevels': stressLevelsResult.body!,
        'qualityOfSleeps': qualityOfSleepResult.body!,
      });
  }

  void fillDropdownsFromGet(){
    if (healthConditionOptions.isEmpty){
      healthConditionOptions
      .addAll(Get.arguments['healthConditions']);
    }

    if (medicationUseOptions.isEmpty){
      medicationUseOptions
      .addAll(Get.arguments['medicationUses']);
    }
  }
}