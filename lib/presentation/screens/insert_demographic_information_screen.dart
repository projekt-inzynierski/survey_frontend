import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/age_category_dto.dart';
import 'package:survey_frontend/presentation/controllers/insert_demographic_information_controller.dart';
import 'package:survey_frontend/presentation/screens/insert_respondent_data_content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class InsertDemographicInformationDataScreen
    extends GetView<InsertDemographicInformationController> {
  const InsertDemographicInformationDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fillDropdownsFromGet();
    return InsertRespondentDataContent(
        formKey: controller.formKey,
        onPressed: controller.next,
        children: [
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.gender),
              value: controller.sexes.firstWhereOrNull((element) => element.identification == controller.createRespondentDataDto?.gender),
              isExpanded: true,
              items: controller.sexes
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.createRespondentDataDto?.gender = value?.identification;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField<AgeCategoryDto>(
              validator: controller.validateNotEmpty,
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.ageCategory),
              value: controller.createRespondentDataDto?.ageCategoryId == null ? null : controller.ageCategories.firstWhere((element) => element.id == controller.createRespondentDataDto?.ageCategoryId),
              isExpanded: true,
              items: controller.ageCategories
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.createRespondentDataDto?.ageCategoryId = value?.id;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.employment),
              value: controller.createRespondentDataDto?.occupationCategoryId == null ? null : controller.occupationCategories.firstWhere((element) => element.id == controller.createRespondentDataDto?.occupationCategoryId),
              isExpanded: true,
              items: controller.occupationCategories
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.createRespondentDataDto?.occupationCategoryId = value?.id;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.education),
              value: controller.createRespondentDataDto?.educationCategoryId == null ? null : controller.educationCategories.firstWhere((element) => element.id == controller.createRespondentDataDto?.educationCategoryId),
              isExpanded: true,
              items: controller.educationCategories
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.createRespondentDataDto?.educationCategoryId = value?.id;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.greeneryArea),
              value: controller.createRespondentDataDto?.greeneryAreaCategoryId == null ? null : controller.greeneryAreaCategories.firstWhere((element) => element.id == controller.createRespondentDataDto?.greeneryAreaCategoryId),
              isExpanded: true,
              items: controller.greeneryAreaCategories
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.createRespondentDataDto?.greeneryAreaCategoryId = value?.id;
              }))
        ]);
  }
}
