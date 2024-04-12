import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:survey_frontend/presentation/controllers/insert_well_being_information_controller.dart';

class InsertWellBeingInformationScreen
    extends GetView<InsertWellBeingInformationController> {
  const InsertWellBeingInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Well being",
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(
                height: 20,
              ),
              Obx(() => DropdownButtonFormField(
                  validator: controller.validateNotEmpty,
                  decoration:
                      const InputDecoration(labelText: "Life satisfaction"),
                  isExpanded: true,
                  value: controller.selectedLifeSatisfactionOption.value,
                  items: controller.lifeSatisfactionOptions
                      .map((val) => DropdownMenuItem(
                            value: val,
                            child: Text(val),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedLifeSatisfactionOption.value = value!;
                  })),
              const SizedBox(height: 20),
              Obx(() => DropdownButtonFormField(
                  validator: controller.validateNotEmpty,
                  decoration: const InputDecoration(labelText: "Stress level"),
                  isExpanded: true,
                  value: controller.selectedStressLevelOption.value,
                  items: controller.stressLevelOptions
                      .map((val) => DropdownMenuItem(
                            value: val,
                            child: Text(val),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedStressLevelOption.value = value!;
                  })),
              const SizedBox(height: 20),
              Obx(() => DropdownButtonFormField(
                  validator: controller.validateNotEmpty,
                  decoration:
                      const InputDecoration(labelText: "Quality of sleep"),
                  isExpanded: true,
                  value: controller.selectedQualityOfSleepOption.value,
                  items: controller.qualityOfSleepOptions
                      .map((val) => DropdownMenuItem(
                            value: val,
                            child: Text(val),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedQualityOfSleepOption.value = value!;
                  })),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45 - 20,
                    child: GFButton(
                        onPressed: controller.back,
                        text: "Back",
                        textStyle: const TextStyle(fontSize: 20),
                        type: GFButtonType.solid,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45 - 20,
                    child: GFButton(
                      onPressed: controller.next,
                      text: "Submit",
                      textStyle: const TextStyle(fontSize: 20),
                      type: GFButtonType.solid,
                      color: Theme.of(context).primaryColor,
                      blockButton: true,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
