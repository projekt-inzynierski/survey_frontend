import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/age_category_dto.dart';
import 'package:survey_frontend/presentation/controllers/insert_demographic_information_controller.dart';
import 'package:survey_frontend/presentation/screens/insert_respondent_data_content.dart';

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
              decoration: const InputDecoration(labelText: "Płeć"),
              value: switch (controller.createRespondentDataDto?.gender){
                'male' => 'kobieta',
                'female' => 'mężczyzna',
                _ => null
              },
              isExpanded: true,
              items: controller.genders
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val),
                      ))
                  .toList(),
              onChanged: (value) {
                String? actualValue = switch (value) {
                  'kobieta' => 'male',
                  'mężczyzna' => 'female',
                  _ => null
                };
                controller.createRespondentDataDto?.gender = actualValue;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField<AgeCategoryDto>(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Kategoria wiekowa"),
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
              decoration: const InputDecoration(labelText: "Zatrudnienie"),
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
              decoration: const InputDecoration(labelText: "Wykształcenie"),
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
              decoration: const InputDecoration(labelText: "Greenery area"),
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
