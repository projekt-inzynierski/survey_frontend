import 'package:get/get.dart';
import 'package:survey_frontend/domain/local_services/notification_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SurveyShortInfo {
  final String name;
  final String id;
  DateTime startTime;
  DateTime finishTime;
  SurveyShortInfo(
      {required this.name,
      required this.id,
      required this.finishTime,
      required this.startTime});

  void setNotification() {
    // TODO: nice if it will take a user to the survey immediately
    NotificationService.scheduleNotification(startTime,
        title: name, body: AppLocalizations.of(Get.context!)!.surveyStartBody);
    NotificationService.scheduleNotification(
        finishTime.subtract(const Duration(minutes: 15)),
        title: name,
        body: AppLocalizations.of(Get.context!)!.surveyFinishBody);
  }
}
