import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/respondent_data_controller.dart';

class RespondentDataTabView extends GetView<RespondentDataController>{
  const RespondentDataTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                  const SizedBox(height: 10,),
                  Obx(() => TextFormField(
                    readOnly: true,
                    decoration: const InputDecoration(labelText: "Gender"),
                    initialValue: controller.gender.value,
                  )),
                    const SizedBox(height: 20),
                    Obx(() => TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(labelText: "Age category"),
                      initialValue: controller.ageCategory.value,
                    )),
                    const SizedBox(height: 20),
                    Obx(() => TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(labelText: "Occupation"),
                      initialValue: controller.occupationCategory.value,
                    )),
                    const SizedBox(height: 20),
                    Obx(() => TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(labelText: "Education"),
                      initialValue: controller.educationCategory.value,
                    )),
                    const SizedBox(height: 20),
                    Obx(() => TextFormField(
                    readOnly: true,
                    decoration: const InputDecoration(labelText: "Health condition"),
                    initialValue: controller.healthCondition.value,
                  )),
                    const SizedBox(height: 20),
                    Obx(() => TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(labelText: "Medication use"),
                      initialValue: controller.medicationUse.value,
                    )),
                    const SizedBox(height: 20),
                    Obx(() => TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(labelText: "Life satisfaction"),
                      initialValue: controller.lifeSatisfaction.value,
                    )),
                    const SizedBox(height: 20),
                    Obx(() => TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(labelText: "Stress level"),
                      initialValue: controller.stressLevel.value,
                    )),
                    const SizedBox(height: 20),
                    Obx(() => TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(labelText: "Quality of sleep"),
                      initialValue: controller.qualityOfSleep.value,
                    ))
                ],
                ),
            )
          ),
        ],
      ),
    );
  }

}