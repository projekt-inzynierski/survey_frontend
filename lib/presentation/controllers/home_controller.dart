import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class HomeController extends ControllerBase {
  RxList<SurveyShortInfo> pendingSurveys = [
    SurveyShortInfo(
        name: 'Some pending survey', id: 'assets/mocked/survey.json'),
    SurveyShortInfo(
        name: 'Another pending survey', id: 'assets/mocked/survey.json'),
    SurveyShortInfo(
        name: 'Yet another pending survey', id: 'assets/mocked/survey.json'),
  ].obs;
  final RxInt hours = 5.obs;
  final RxInt minutes = 13.obs;
}

class SurveyShortInfo {
  final String name;
  final String id;
  SurveyShortInfo({required this.name, required this.id});
}
