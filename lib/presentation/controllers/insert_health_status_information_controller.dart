import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/health_condition_dto.dart';
import 'package:survey_frontend/domain/models/medication_use_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class InsertHealthStatusInformationController  extends ControllerBase{
  final RxList<HealthConditionDto> healthConditionOptions = <HealthConditionDto>[].obs;
  final RxList<MedicationUseDto> medicationUseOptions = <MedicationUseDto>[].obs;

  Rx<HealthConditionDto?> selectedHealthConditionOption = Rx(null);
  Rx<MedicationUseDto?> selectedMedicationUseOption = Rx(null); 

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
        await Get.toNamed("/insertdemograficinformation/inserthealthstatusinformation/insertwellbeinginformation");
      }
    } catch (e){
      await handleSomethingWentWrong(e);
    }finally{
      isBusy = false;
    }
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