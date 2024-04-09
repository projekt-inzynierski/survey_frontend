import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class InsertWellBeingInformationController extends ControllerBase{
  final RxList<String> lifeSatisfactionOptions = ["good", "bad"].obs;
  final RxList<String> stressLevelOptions = ["high", "medium", "low"].obs;
  final RxList<String> qualityOfSleepOptions = ["high", "medium", "low"].obs;


  Rx<String?> selectedLifeSatisfactionOption = Rx(null);
  Rx<String?> selectedStressLevelOption = Rx(null); 
  Rx<String?> selectedQualityOfSleepOption = Rx(null); 

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
        await Get.offAllNamed("/home");
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