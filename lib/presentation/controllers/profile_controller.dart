import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/domain/models/initial_survey_question.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileController extends ControllerBase {
  final Map<String, dynamic> respondentData;
  late List<InitialSurveyQuestion> initialSurveyQuestions;

  ProfileController(GetStorage storage)
      : respondentData = storage.read("respondentData")! {
    initialSurveyQuestions = storage
        .read<List<dynamic>>('initialSurvey')!
        .map((e) => InitialSurveyQuestion.fromJson(e))
        .toList();
  }

  String getLabelFormIndex(int index) {
    //0 is for id, we do not want to display it
    if (index == 1) {
      return AppLocalizations.of(Get.context!)!.username;
    }

    return respondentData.keys.toList()[index];
  }

  String getValueForIndex(String question) {
    if (question.toLowerCase() == 'username') {
      return respondentData['username'];
    }

    final actualQuestion =
        initialSurveyQuestions.firstWhereOrNull((q) => q.content == question);

    if (actualQuestion == null) {
      return '';
    }

    final selectedOption = actualQuestion.options
        .firstWhereOrNull((o) => o.id == respondentData[question]);

    if (selectedOption == null) {
      return '';
    }

    return selectedOption.content;
  }
}
