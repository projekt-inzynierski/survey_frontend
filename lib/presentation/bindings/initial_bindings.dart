import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/archived_surveys_controller.dart';
import 'package:survey_frontend/presentation/controllers/pending_surveys_controller.dart';
import 'package:survey_frontend/presentation/controllers/respondent_data_controller.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RespondentDataController());
    Get.lazyPut(() => PendingSurveysController());
    Get.lazyPut(() => ArchivedSurveysController());
  }

}