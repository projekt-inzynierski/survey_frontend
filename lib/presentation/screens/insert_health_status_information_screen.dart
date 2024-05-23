import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/domain/models/health_condition_dto.dart';
import 'package:survey_frontend/domain/models/medication_use_dto.dart';
import 'package:survey_frontend/presentation/controllers/insert_health_status_information_controller.dart';
import 'package:survey_frontend/presentation/screens/insert_respondent_data_content.dart';

class InsertHealthStatusInformationScreen
    extends GetView<InsertHealthStatusInformationController> {
  const InsertHealthStatusInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fillDropdownsFromGet();
    return InsertRespondentDataContent(
        formKey: controller.formKey,
        onPressed: controller.next,
        children: [
          Obx(() => DropdownButtonFormField<HealthConditionDto>(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Stan zdrowia"),
              isExpanded: true,
              value: controller.createRespondentDataDto?.healthConditionId == null ? null : controller.healthConditionOptions.firstWhere((element) => element.id == controller.createRespondentDataDto?.healthConditionId),
              items: controller.healthConditionOptions
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.createRespondentDataDto?.healthConditionId = value?.id;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField<MedicationUseDto>(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Leki"),
              isExpanded: true,
              value: controller.createRespondentDataDto?.medicationUseId == null ? null : controller.medicationUseOptions.firstWhere((element) => element.id == controller.createRespondentDataDto?.medicationUseId),
              items: controller.medicationUseOptions
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.createRespondentDataDto?.medicationUseId = value?.id;
              }))
        ]);
  }
}
