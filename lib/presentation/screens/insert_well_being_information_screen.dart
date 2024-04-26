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
              value: controller.createRespondentDataDto?.lifeSatisfactionId == null ? null : controller.lifeSatisfactionOptions.firstWhere((element) => element.id == controller.createRespondentDataDto?.lifeSatisfactionId),
              items: controller.lifeSatisfactionOptions
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.createRespondentDataDto?.lifeSatisfactionId = value?.id;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Poziom stresu"),
              isExpanded: true,
              value: controller.createRespondentDataDto?.stressLevelId == null ? null : controller.stressLevelOptions.firstWhere((element) => element.id == controller.createRespondentDataDto?.stressLevelId),
              items: controller.stressLevelOptions
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.createRespondentDataDto?.stressLevelId = value?.id;
              })),
          const SizedBox(height: 20),
          Obx(() => DropdownButtonFormField(
              validator: controller.validateNotEmpty,
              decoration: const InputDecoration(labelText: "Jakość snu"),
              isExpanded: true,
              value: controller.createRespondentDataDto?.qualityOfSleepId == null ? null : controller.qualityOfSleepOptions.firstWhere((element) => element.id == controller.createRespondentDataDto?.qualityOfSleepId),
              items: controller.qualityOfSleepOptions
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val.display),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.createRespondentDataDto?.qualityOfSleepId = value?.id;
              }))
        ]);
  }
}
