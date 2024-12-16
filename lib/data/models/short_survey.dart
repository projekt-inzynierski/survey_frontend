import 'package:get/get.dart';
import 'package:path/path.dart';
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

  void setSurveyNotifications() {
    // TODO: nice if it will take a user to the survey immediately
    const timeBeforeFinish = 15;

    // this code is making a unique value for notification id
    const timeResidue = (Duration.minutesPerDay * 2 * 30); // 2 months
    final hashID = hash(id).toUnsigned(12).toInt();

    final startIDTimeComponent =
        startTime.millisecondsSinceEpoch.milliseconds.inMinutes % timeResidue;
    final startID = int.parse("$startIDTimeComponent${hashID}0").toSigned(32);

    final finishIDTimeComponent =
        finishTime.millisecondsSinceEpoch.milliseconds.inMinutes % timeResidue;
    final finishID = int.parse("$finishIDTimeComponent${hashID}1").toSigned(32);

    NotificationService.scheduleNotification(
        startTime.toLocal(),
        startID,
        AppLocalizations.of(Get.context!)!.surveyStartTitle,
        AppLocalizations.of(Get.context!)!.surveyStartBody);

    if (finishTime
        .subtract(const Duration(minutes: timeBeforeFinish))
        .isBefore(startTime)) {
      return;
    }
    NotificationService.scheduleNotification(
        finishTime
            .toLocal()
            .subtract(const Duration(minutes: timeBeforeFinish)),
        finishID,
        AppLocalizations.of(Get.context!)!.surveyFinishTitle,
        AppLocalizations.of(Get.context!)!.surveyFinishBody);
  }
}
