import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/health_condition_service.dart';
import 'package:survey_frontend/domain/external_services/medication_use_service.dart';
import 'package:survey_frontend/domain/models/age_category_dto.dart';
import 'package:survey_frontend/domain/models/education_category_dto.dart';
import 'package:survey_frontend/domain/models/greenery_area_category_dto.dart';
import 'package:survey_frontend/domain/models/health_condition_dto.dart';
import 'package:survey_frontend/domain/models/medication_use_dto.dart';
import 'package:survey_frontend/domain/models/occupation_category_dto.dart';
import 'package:survey_frontend/domain/models/create_respondent_data_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class InsertDemographicInformationController extends ControllerBase{
  final HealthConditionService _healthConditionService;
  final MedicationUseService _medicationUseService;

  //TODO: localize gender
  final RxList<String> genders = ["kobieta", "mężczyzna"].obs;
  final RxList<AgeCategoryDto> ageCategories = <AgeCategoryDto>[].obs;
  final RxList<OccupationCategoryDto> occupationCategories = <OccupationCategoryDto>[].obs;
  final RxList<EducationCategoryDto> educationCategories = <EducationCategoryDto>[].obs;
  final RxList<GreeneryAreaCategoryDto> greeneryAreaCategories = <GreeneryAreaCategoryDto>[].obs;

  CreateRespondentDataDto? createRespondentDataDto;
  

  final formKey = GlobalKey<FormState>();
  bool isBusy = false;

  InsertDemographicInformationController(this._healthConditionService, this._medicationUseService);

  String? validateNotEmpty(Object? value){
    if (value == null){
      return AppLocalizations.of(Get.context!)!.valueNotEmpty;
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
    Future<APIResponse<List<MedicationUseDto>>> medicationUseFuture = _medicationUseService.getMedicationUses();
    Future<APIResponse<List<HealthConditionDto>>> healthConditionFuture = _healthConditionService.getHealthConditions();

    await Future.wait([
      medicationUseFuture, 
      healthConditionFuture
      ]);

      APIResponse<List<MedicationUseDto>> medicationUseResult = await medicationUseFuture;
      APIResponse<List<HealthConditionDto>> healthConditionResult = await healthConditionFuture;

      if (medicationUseResult.error != null || medicationUseResult.statusCode != 200
      || healthConditionResult.error != null || healthConditionResult.statusCode != 200){
        await handleSomethingWentWrong(null);
        return;
      }

      await Get.toNamed("/inserthealthstatusinformation",
      arguments: {
        'medicationUses': medicationUseResult.body!,
        'healthConditions': healthConditionResult.body!,
        'dto': createRespondentDataDto
      });
  }

  void fillDropdownsFromGet(){
    createRespondentDataDto ??= Get.arguments['dto'];
    
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