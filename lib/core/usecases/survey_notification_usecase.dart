import 'dart:math';

import 'package:survey_frontend/data/datasources/local/database_service.dart';
import 'package:survey_frontend/data/models/short_survey.dart';
import 'package:survey_frontend/domain/local_services/notification_service.dart';

abstract class SurveyNotificationUseCase{
  Future<void> scheduleSurveysNotifications();
}

class SurveyNotificationUseCaseImpl implements SurveyNotificationUseCase{
  final DatabaseHelper _databaseHelper;

  SurveyNotificationUseCaseImpl(this._databaseHelper);

  @override
  Future<void> scheduleSurveysNotifications() async{
    NotificationService.cancelAllNotifications();
    List<SurveyShortInfo> futureAndOngoingSurveys =
        await _databaseHelper.getFutureAndOngoingSurveys();
    futureAndOngoingSurveys.sort((a, b) => a.startTime.compareTo(b.startTime));
    futureAndOngoingSurveys
        .sublist(0, min(50, futureAndOngoingSurveys.length))
        .forEach((e) {
      e.setSurveyNotifications();
    });
  }

}