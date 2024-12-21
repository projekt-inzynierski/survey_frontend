import 'package:calendar_view/calendar_view.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:survey_frontend/core/usecases/calendar_event_usecase.dart';
import 'package:survey_frontend/l10n/get_localizations.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class CalendarController extends ControllerBase {
  final eventController = EventController();
  final CalendarEventUsecase _calendarEventUsecase;
  final Rx<CalendarView> selectedView = CalendarView.day.obs;

  CalendarController(this._calendarEventUsecase);

  void loadEvents() async {
    try {
      final events = await _calendarEventUsecase.getAllSurveyCalendarEvents();
      final calendarEventDatas = events
          .map((e) => CalendarEventData(
              title: e.surveyName,
              date: e.from,
              startTime: e.from,
              endTime: e.to,
              event: e))
          .toList();
      eventController.addAll(calendarEventDatas);
    } catch (e) {
      Sentry.captureException(e);
    }
  }

  String getCalendarViewDisplay(CalendarView view){
    return view == CalendarView.day ? getAppLocalizations().day : getAppLocalizations().week;
  }
}

enum CalendarView {
  day, week
}
