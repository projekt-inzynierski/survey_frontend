import 'package:get/get.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/short_survey_service.dart';
import 'package:survey_frontend/domain/external_services/survey_service.dart';
import 'package:survey_frontend/domain/models/short_survey_dto.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class HomeController extends ControllerBase {
  final ShortSurveyService _homeService;
  final SurveyService _surveyService;
  RxList<ShortSurveyDto> pendingSurveys = <ShortSurveyDto>[].obs;
  final RxInt hours = 5.obs;
  final RxInt minutes = 13.obs;
  bool _isBusy = false;

  HomeController(this._homeService, this._surveyService) {
    _loadShortSurveys();
  }

  Future<void> _loadShortSurveys() async {
    if (_isBusy) {
      return;
    }

    try {
      _isBusy = true;
      pendingSurveys.clear();
      APIResponse<List<ShortSurveyDto>> response =
          await _homeService.getShortSurvey();
      if (response.error != null || response.statusCode != 200) {
        await handleSomethingWentWrong(null);
        return;
      }
      pendingSurveys.addAll(response.body!);
    } catch (e){
      //TODO: log the exception
      await popup("Błąd", "Nie udało się załądować ankiet. Spróbuj ponownie później.");
    } finally {
      _isBusy = false;
    }
  }

  void startCompletingSurvey(String surveyId) async{
    if (_isBusy){
      return;
    }

    try{
      _isBusy = true;
      SurveyDto? survey = await _loadSurvey(surveyId);
      if (survey == null){
        await popup("Błąd", "Nie udało się załadować wybranej ankiety");
        return;
      }

      await Get.toNamed("/surveystart", arguments: {
        "survey": survey
      });
    } catch(e){
      await popup("Błąd", "Nie udało się załadować wybranej ankiety");
    } finally{
      _isBusy = false;
    }
  }

  Future<SurveyDto?> _loadSurvey(String surveyId) async{
    APIResponse<SurveyDto> response =
        await _surveyService.getSurvey(surveyId);
    if (response.error != null || response.body == null) {
      return null;
    }
   return response.body!;
  }
}

class SurveyShortInfo {
  final String name;
  final String id;
  SurveyShortInfo({required this.name, required this.id});
}
