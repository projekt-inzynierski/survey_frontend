import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class InsertHealthStatusInformationController  extends ControllerBase{
  final RxList<String> healthConditionOptions = ["good", "bad"].obs;
  final RxList<String> medicationUseOptions = ["yes", "no"].obs;

  Rx<String?> selectedHealthConditionOption = Rx(null);
  Rx<String?> selectedMedicationUseOption = Rx(null); 

  final formKey = GlobalKey<FormState>();
  bool isBusy = false;

  String? validateNotEmpty(String? value){
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

  void back(){
    Get.back();
  }
}