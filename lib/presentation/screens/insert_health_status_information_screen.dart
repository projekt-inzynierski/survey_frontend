import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:survey_frontend/presentation/controllers/insert_health_status_information_controller.dart';

class InsertHealthStatusInformationScreen
    extends GetView<InsertHealthStatusInformationController> {
  const InsertHealthStatusInformationScreen({super.key});

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
              Text("Health status information",
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(
                height: 20,
              ),
              Obx(() => DropdownButtonFormField(
                  validator: controller.validateNotEmpty,
                  decoration:
                      const InputDecoration(labelText: "Health status"),
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
                  decoration: const InputDecoration(labelText: "Medication use"),
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
                  })),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45 -
                        20, 
                    child: GFButton(
                        onPressed: controller.back,
                        text: "Back",
                        textStyle: const TextStyle(fontSize: 20),
                        type: GFButtonType.solid,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45 -
                        20, 
                    child: GFButton(
                      onPressed: controller.next,
                      text: "Next (2/3)",
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
