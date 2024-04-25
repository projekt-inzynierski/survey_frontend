import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/age_category_dto.dart';
import 'package:survey_frontend/domain/models/education_category_dto.dart';
import 'package:survey_frontend/domain/models/greenery_area_category_dto.dart';
import 'package:survey_frontend/domain/models/occupation_category_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class InsertDemographicInformationController extends ControllerBase{
  final RxList<String> genders = ["kobieta", "mężczyzna"].obs;
  final RxList<AgeCategoryDto> ageCategories = <AgeCategoryDto>[].obs;
  final RxList<OccupationCategoryDto> occupationCategories = <OccupationCategoryDto>[].obs;
  final RxList<EducationCategoryDto> educationCategories = <EducationCategoryDto>[].obs;
  final RxList<GreeneryAreaCategoryDto> greeneryAreaCategories = <GreeneryAreaCategoryDto>[].obs;

  Rx<String?> selectedGender = Rx(null);
  Rx<AgeCategoryDto?> selectedAgeCategory = Rx(null);
  Rx<OccupationCategoryDto?> selectedOccupationCategory = Rx(null);
  Rx<EducationCategoryDto?> selectedEducationCategory = Rx(null);
  Rx<GreeneryAreaCategoryDto?> selectedGreeneryAreaCategory = Rx(null);

  final formKey = GlobalKey<FormState>();
  bool isBusy = false;

  String? validateNotEmpty(Object? value){
    if (value == null){
      return "Wartość nie może być pusta";
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

  void fillDropdownsFromGet(){
    if (ageCategories.isEmpty){
      ageCategories
      .addAll(Get.arguments['ageCategories']);
    }
    
    if (occupationCategories.isEmpty){
      occupationCategories
      .addAll(Get.arguments['occupationCategories']);
    }

    if (educationCategories.isEmpty){
      educationCategories
      .addAll(Get.arguments['educationCategories']);
    }

    if (greeneryAreaCategories.isEmpty){
      greeneryAreaCategories
      .addAll(Get.arguments['greeneryAreaCategories']);
    }
  }
}