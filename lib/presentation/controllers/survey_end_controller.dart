import 'package:get/get.dart';
import 'package:survey_frontend/domain/external_services/survey_response_service.dart';
import 'package:survey_frontend/domain/local_services/survey_participation_service.dart';
import 'package:survey_frontend/domain/models/create_survey_resopnse_dto.dart';
import 'package:survey_frontend/domain/models/survey_participation_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SurveyEndController extends ControllerBase{
  late CreateSurveyResponseDto dto;
  final SurveyResponseService _service;
  final SurveyParticipationService _surveyParticipationService;
  bool _isBusy = false;

  SurveyEndController(this._service, this._surveyParticipationService);

  void endSurvey() async{
    if (_isBusy){
      return;
    }

    try{
      _isBusy = true;
      final participation = await _submitToServer();
      if (participation == null){
        popup(AppLocalizations.of(Get.context!)!.error,
            AppLocalizations.of(Get.context!)!.answerSubmitError);
      } else{
        await _surveyParticipationService.addParticipation(participation);
      }
      Get.offAllNamed(
      "/home",
      );
    } catch (e){
      popup(AppLocalizations.of(Get.context!)!.error,
          AppLocalizations.of(Get.context!)!.mainPageTransitionError);
    } finally{
      _isBusy = false;
    }
  }

  Future<SurveyParticipationDto?> _submitToServer() async{
    try{
      final apiResponse = await _service.submitResponse(dto);
      return apiResponse.body;
    } catch (e){
      //TODO: log the error
      return null;
    }
  }

  void readGetArgs(){
    dto = Get.arguments['responseModel'];
  }
}