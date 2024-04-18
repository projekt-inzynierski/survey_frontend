import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:survey_frontend/presentation/controllers/insert_demographic_information_controller.dart';

class InsertDemographicInformationDataScreen
    extends GetView<InsertDemographicInformationController> {
  const InsertDemographicInformationDataScreen({super.key});

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
              Text("Demografic information",
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(
                height: 20,
              ),
              Obx(() => DropdownButtonFormField(
                  validator: controller.validateNotEmpty,
                  decoration: const InputDecoration(labelText: "Gender"),
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
              Obx(() => DropdownButtonFormField(
                  validator: controller.validateNotEmpty,
                  decoration: const InputDecoration(labelText: "Age category"),
                  isExpanded: true,
                  value: controller.selectedAgeCategory.value,
                  items: controller.ageCategories
                      .map((val) => DropdownMenuItem(
                            value: val,
                            child: Text(val),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedAgeCategory.value = value;
                  })),
              const SizedBox(height: 20),
              Obx(() => DropdownButtonFormField(
                  validator: controller.validateNotEmpty,
                  decoration:
                      const InputDecoration(labelText: "Occupation category"),
                  isExpanded: true,
                  value: controller.selectedOccupationCategory.value,
                  items: controller.occupationCategories
                      .map((val) => DropdownMenuItem(
                            value: val,
                            child: Text(val),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedOccupationCategory.value = value;
                  })),
              const SizedBox(height: 20),
              Obx(() => DropdownButtonFormField(
                  validator: controller.validateNotEmpty,
                  decoration: const InputDecoration(labelText: "Age category"),
                  isExpanded: true,
                  value: controller.selectedEducationCategory.value,
                  items: controller.educationCategories
                      .map((val) => DropdownMenuItem(
                            value: val,
                            child: Text(val),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedEducationCategory.value = value;
                  })),
              const SizedBox(
                height: 20,
              ),
              GFButton(
                onPressed: controller.next,
                text: "Next (1/3)",
                textStyle: const TextStyle(fontSize: 20),
                type: GFButtonType.solid,
                color: Theme.of(context).primaryColor,
                blockButton: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
