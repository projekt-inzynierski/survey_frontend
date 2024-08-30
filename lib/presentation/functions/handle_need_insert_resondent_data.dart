import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/core/models/need_insert_respondent_data_result.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void handle(NeedInsertRespondentDataResult result){
  switch (result){
    case NeedInsertRespondentDataResult.need:
      Get.toNamed('/welcome');
      break;
    case NeedInsertRespondentDataResult.noNeed:
      Get.toNamed('/home');
      break;
    case NeedInsertRespondentDataResult.error:
      Get.defaultDialog(
        title: AppLocalizations.of(Get.context!)!.error,
        middleText: AppLocalizations.of(Get.context!)!.error,
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Ok"),
        ));
      break;
  }
}