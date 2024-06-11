import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/short_survey_service.dart';
import 'package:survey_frontend/domain/models/short_survey_dto.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class HomeController extends ControllerBase {
  final ShortSurveyService _homeService;
  RxList<ShortSurveyDto> pendingSurveys = <ShortSurveyDto>[].obs;

  HomeController(this._homeService) {
    _loadShortSurveys();
  }

  Future<void> _loadShortSurveys() async {
    pendingSurveys.clear();
    APIResponse<List<ShortSurveyDto>> response =
        await _homeService.getShortSurvey();
    if (response.error != null || response.body == null) {
      // TODO: swap for "response.statusCode != 200"
      // await handleSomethingWentWrong(null);
      return;
    }
    pendingSurveys.addAll(response.body!);
  }
  
  final RxInt hours = 5.obs;
  final RxInt minutes = 13.obs;
}

class SurveyShortInfo {
  final String name;
  final String id;
  SurveyShortInfo({required this.name, required this.id});
}