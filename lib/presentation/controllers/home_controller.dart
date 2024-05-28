import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class HomeController extends ControllerBase {
  RxList<String> pendingSurveys = [
    "Some pending survey",
    "Another pending survey",
    "Yet another pending survey"
  ].obs;
  final RxInt hours = 5.obs;
  final RxInt minutes = 13.obs;
}
