import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:survey_frontend/presentation/controllers/pending_surveys_controller.dart';

class PendingSurveysTabView extends GetView<PendingSurveysController>{
  const PendingSurveysTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(15),
      child: Obx(() => ListView.builder(
        itemCount: controller.pendingSurveys.length,
        itemBuilder: (context, index) => 
        GFListTile(
          color: const Color.fromARGB(255, 220, 217, 217),
          description: const Text("Lorem ipsum dolor sit amet"),
          titleText: controller.pendingSurveys[index],
          icon: const Icon(FontAwesomeIcons.clock, color: Colors.red,),
        )
      )),
    );
  }
}