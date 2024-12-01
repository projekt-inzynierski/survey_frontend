import 'package:get/get.dart';
import 'package:survey_frontend/data/datasources/local/database_service.dart';
import 'package:survey_frontend/domain/external_services/survey_response_service.dart';
import 'package:survey_frontend/domain/local_services/survey_participation_service.dart';
import 'package:survey_frontend/domain/models/create_survey_response_dto.dart';
import 'package:survey_frontend/domain/models/survey_participation_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SurveyEndController extends ControllerBase {
  late CreateSurveyResponseDto dto;
  final SurveyResponseService _service;
  final SurveyParticipationService _surveyParticipationService;
  final DatabaseHelper _databaseHelper;
  bool _isBusy = false;

  SurveyEndController(
      this._service, this._surveyParticipationService, this._databaseHelper);

  void endSurvey() async {
    if (_isBusy) {
      return;
    }

    try {
      _isBusy = true;
      final participation = await _submitToServer();
      if (participation == null) {
        popup(AppLocalizations.of(Get.context!)!.error,
            AppLocalizations.of(Get.context!)!.answerSubmitError);
      } else {
        await _surveyParticipationService.addParticipation(participation);
        await _databaseHelper.removeSurveyTimeSlot(participation.surveyId);
      }

      Get.offAllNamed(
        "/home",
      );
    } catch (e) {
      popup(AppLocalizations.of(Get.context!)!.error,
          AppLocalizations.of(Get.context!)!.mainPageTransitionError);
    } finally {
      _isBusy = false;
    }
  }

  Future<SurveyParticipationDto?> _submitToServer() async {
    try {
      dto.finishDate = DateTime.now().toUtc().toIso8601String();
      final apiResponse = await _service.submitResponse(dto);
      return apiResponse.body;
    } catch (e) {
      popup(AppLocalizations.of(Get.context!)!.error,
          AppLocalizations.of(Get.context!)!.mainPageTransitionError);
      //TODO: log the error
      return null;
    }
  }

  void readGetArgs() {
    dto = Get.arguments['responseModel'];
  }
}
