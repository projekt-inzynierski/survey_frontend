import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:survey_frontend/presentation/controllers/archived_surveys_controller.dart';

class ArchivedSurveysTabView extends GetView<ArchivedSurveysController>{
  const ArchivedSurveysTabView({super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding:  const EdgeInsets.all(15),
      child: Obx(() => ListView.builder(
        itemCount: controller.archivedSurveys.length,
        itemBuilder: (context, index) => 
        GFListTile(
          color: const Color.fromARGB(255, 220, 217, 217),
          description: const Text("Lorem ipsum dolor sit amet"),
          titleText: controller.archivedSurveys[index],
        )
      )),
    );
  }

}