import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/insert_health_status_information_controller.dart';
import 'package:survey_frontend/presentation/screens/insert_respondent_data_content.dart';

class InsertHealthStatusInformationScreen
    extends GetView<InsertHealthStatusInformationController> {
  const InsertHealthStatusInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InsertRespondentDataContent(
        formKey: controller.formKey,
        onPressed: controller.next,
        children: [
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Stan zdrowia"),
              isExpanded: true,
              value: controller.selectedHealthConditionOption.value,
              items: controller.healthConditionOptions
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.selectedHealthConditionOption.value = value!;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Leki"),
              isExpanded: true,
              value: controller.selectedMedicationUseOption.value,
              items: controller.medicationUseOptions
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.selectedMedicationUseOption.value = value!;
              }))
        ]);
  }
}
