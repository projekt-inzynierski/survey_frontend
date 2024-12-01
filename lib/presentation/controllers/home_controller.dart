import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/core/usecases/create_question_answer_dto_factory.dart';
import 'package:survey_frontend/data/datasources/local/database_service.dart';
import 'package:survey_frontend/data/models/short_survey.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/respondent_group_service.dart';
import 'package:survey_frontend/domain/external_services/short_survey_service.dart';
import 'package:survey_frontend/domain/external_services/survey_service.dart';
import 'package:survey_frontend/domain/local_services/notification_service.dart';
import 'package:survey_frontend/domain/models/create_survey_response_dto.dart';
import 'package:survey_frontend/domain/models/respondent_data_dto.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';
import 'package:survey_frontend/domain/models/survey_with_time_slots.dart';
import 'package:survey_frontend/domain/models/visibility_type.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:survey_frontend/presentation/static/routes.dart';

class HomeController extends ControllerBase {
  final ShortSurveyService _homeService;
  final SurveyService _surveyService;
  final CreateQuestionAnswerDtoFactory _createQuestionAnswerDtoFactory;
  final RespondentGroupService _respondentGroupService;
  final GetStorage _storage;
  RxList<SurveyShortInfo> pendingSurveys = <SurveyShortInfo>[].obs;
  final RxInt hours = 23.obs;
  final RxInt minutes = 60.obs;
  final DatabaseHelper _databaseHelper;
  bool _isBusy = false;

  HomeController(
      this._homeService,
      this._surveyService,
      this._createQuestionAnswerDtoFactory,
      this._respondentGroupService,
      this._storage,
      this._databaseHelper);

  Future<void> loadSurveys() async {
    if (_isBusy) {
      return;
    }

    try {
      _isBusy = true;
      await _loadFromApi();
    } catch (e) {
      //TODO: log the exception
      await popup(AppLocalizations.of(Get.context!)!.error,
          AppLocalizations.of(Get.context!)!.loadingSurveyErrorTryAgainLater);
    } finally {
      _isBusy = false;
    }
  }

  Future<void> _loadFromApi() async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.none) {
      return;
    }

    APIResponse<List<SurveyWithTimeSlots>> response =
        await _homeService.getSurveysWithTimeSlots();

    if (response.error != null || response.statusCode != 200) {
      return;
    }

    if (await _databaseHelper.upsertSurveys(response.body!)) {
      pendingSurveys.clear();
      await _loadFromDatabase();
    }
    return;
  }

  int hoursLeft() {
    if (pendingSurveys.isEmpty) {
      return 0;
    }

    final today = DateTime.now();
    final timeFinish = Duration(hours: hours.value, minutes: minutes.value);
    final timeNow = Duration(hours: today.hour, minutes: today.minute);
    final timeLeft = timeFinish - timeNow;
    return timeLeft.inHours;
  }

  int minutesLeft() {
    if (pendingSurveys.isEmpty) {
      return 0;
    }

    final today = DateTime.now();
    final timeFinish = Duration(hours: hours.value, minutes: minutes.value);
    final timeNow = Duration(hours: today.hour, minutes: today.minute);
    final timeLeft = timeFinish - timeNow;
    return timeLeft.inMinutes.remainder(60);
  }

  bool hasTimeSlotForToday(SurveyWithTimeSlots survey) {
    final today = DateTime.now();
    return survey.surveySendingPolicyTimes.any((element) =>
        element.start.year == today.year &&
        element.start.month == today.month &&
        element.start.day == today.day);
  }

  void startCompletingSurvey(String surveyId) async {
    if (_isBusy) {
      return;
    }

    try {
      _isBusy = true;
      final futures = [_loadSurvey(surveyId), _getGroupsIds()];
      final results = await Future.wait(futures);
      SurveyDto? survey = results[0] as SurveyDto?;
      var respondentGroups = results[1];

      if (survey == null || respondentGroups == null) {
        await popup(AppLocalizations.of(Get.context!)!.error,
            AppLocalizations.of(Get.context!)!.loadingSurveyError);
        return;
      }
      final questions = _getQuestionsFromSurvey(survey);
      final responseModel = _prepareResponseModel(questions, survey.id);
      final triggerableSectionActivationsCounts =
          _getTriggerableSectionActivationsCounts(survey);
      await Get.toNamed("/surveystart", arguments: {
        "survey": survey,
        "questions": questions,
        "responseModel": responseModel,
        "groups": respondentGroups,
        "triggerableSectionActivationsCounts":
            triggerableSectionActivationsCounts
      });
    } catch (e) {
      await popup(AppLocalizations.of(Get.context!)!.error,
          AppLocalizations.of(Get.context!)!.loadingSurveyError);
    } finally {
      _isBusy = false;
    }
  }

  Future<SurveyDto?> _loadSurvey(String surveyId) async {
    APIResponse<SurveyDto> response = await _surveyService.getSurvey(surveyId);
    if (response.error != null || response.body == null) {
      return null;
    }
    return response.body!;
  }

  Future<List<String>?> _getGroupsIds() async {
    var respondentData = _storage.read("respondentData")!;
    final String id = respondentData is RespondentDataDto
        ? respondentData.id
        : respondentData['id'];
    var groupsResponse = await _respondentGroupService.getAllForRespondent(id);

    return groupsResponse.body?.map((e) => (e.id)).toList();
  }

  List<QuestionWithSection> _getQuestionsFromSurvey(SurveyDto surveyObj) {
    return surveyObj.sections
        .expand((section) => section.questions.map((question) =>
            QuestionWithSection(question: question, section: section)))
        .toList();
  }

  CreateSurveyResponseDto _prepareResponseModel(
      List<QuestionWithSection> questions, String surveyId) {
    final questionAnswerDtos = questions
        .map((q) => _createQuestionAnswerDtoFactory.getDto(q.question))
        .toList();

    return CreateSurveyResponseDto(
        surveyId: surveyId,
        startDate: DateTime.now().toUtc().toIso8601String(),
        answers: questionAnswerDtos);
  }

  Map<int, int> _getTriggerableSectionActivationsCounts(SurveyDto survey) {
    Map<int, int> output = {};
    for (final section in survey.sections) {
      if (section.visibility == "answer_triggered") {
        output[section.order] = 0;
      }
    }
    return output;
  }

  Future<void> _loadFromDatabase() async {
    pendingSurveys.addAll(await _databaseHelper.getSurveysCompletableNow());
    _setNotifications();
    // NotificationService.checkPendingNotificationRequests();
  }

  void _setNotifications() async {
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

  void openSettings(){
    Get.toNamed(Routes.settings);
  }

  void openProfile(){
    Get.toNamed(Routes.profile);
  }
}

class QuestionWithSection {
  final Question question;
  final Section section;
  QuestionWithSection({required this.question, required this.section});

  get id => question.id;

  bool canQuestionBeShown(List<String?> groupsIds,
      Map<int, int> triggerableSectionActivationsCounts) {
    //TODO: make a class with const strings here
    if (section.visibility == VisibilityType.groupSpecific) {
      return groupsIds.contains(section.groupId);
    }

    if (section.visibility == VisibilityType.answerTriggered) {
      return triggerableSectionActivationsCounts[section.order]! > 0;
    }
    return true;
  }
}
