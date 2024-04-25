import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/age_category_dto.dart';
import 'package:survey_frontend/domain/models/greenery_area_category_dto.dart';
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
              isExpanded: true,
              value: controller.selectedGender.value,
              items: controller.genders
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.selectedGender.value = value;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField<AgeCategoryDto>(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Kategoria wiekowa"),
              isExpanded: true,
              value: controller.selectedAgeCategory.value,
              items: controller.ageCategories
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.selectedAgeCategory.value = value;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Zatrudnienie"),
              isExpanded: true,
              value: controller.selectedOccupationCategory.value,
              items: controller.occupationCategories
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.selectedOccupationCategory.value = value;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Wykształcenie"),
              isExpanded: true,
              value: controller.selectedEducationCategory.value,
              items: controller.educationCategories
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.selectedEducationCategory.value = value;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Greenery area"),
              isExpanded: true,
              value: controller.selectedGreeneryAreaCategory.value,
              items: controller.greeneryAreaCategories
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.selectedGreeneryAreaCategory.value = value;
              }))
        ]);
  }
}
