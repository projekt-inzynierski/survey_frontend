import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/insert_well_being_information_controller.dart';
import 'package:survey_frontend/presentation/screens/insert_respondent_data_content.dart';

class InsertWellBeingInformationScreen
    extends GetView<InsertWellBeingInformationController> {
  const InsertWellBeingInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fillDropdownsFromGet();
    return InsertRespondentDataContent(
        formKey: controller.formKey,
        onPressed: controller.next,
        children: [
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Zadowolenie z życia"),
              isExpanded: true,
              value: controller.selectedLifeSatisfactionOption.value,
              items: controller.lifeSatisfactionOptions
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.selectedLifeSatisfactionOption.value = value!;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Poziom stresu"),
              isExpanded: true,
              value: controller.selectedStressLevelOption.value,
              items: controller.stressLevelOptions
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.selectedStressLevelOption.value = value!;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Jakość snu"),
              isExpanded: true,
              value: controller.selectedQualityOfSleepOption.value,
              items: controller.qualityOfSleepOptions
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.selectedQualityOfSleepOption.value = value!;
              }))
        ]);
  }
}
