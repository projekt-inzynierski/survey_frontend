import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class HomeController extends ControllerBase {
  RxList<String> pendingSurveys = [
    "Some pending survey",
    "Another pending survey",
    "Yet another pending survey"
  ].obs;
}
