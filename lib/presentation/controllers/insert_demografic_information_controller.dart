import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class InsertDemograficInformationController extends ControllerBase{
  final RxList<String> genders = ["Male", "Female"].obs;
  final RxList<String> ageCategories = ["50-59", "60-69", "70 and more"].obs;
  final RxList<String> occupationCategories = ["option 1", "option 2", "option 3"].obs;
  final RxList<String> educationCategories = ["option 1", "option 2", "option 3"].obs;

  Rx<String?> selectedGender = Rx(null);
  Rx<String?> selectedAgeCategory = Rx(null);
  Rx<String?> selectedOccupationCategory = Rx(null);
  Rx<String?> selectedEducationCategory = Rx(null);

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
        await Get.toNamed("/insertdemograficinformation/inserthealthstatusinformation");
      }
    } catch (e){
      await handleSomethingWentWrong(e);
    }finally{
      isBusy = false;
    }
  }
}