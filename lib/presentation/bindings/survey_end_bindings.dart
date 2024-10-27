import 'package:get/get.dart';
import 'package:survey_frontend/data/datasources/local/survey_participation_service_impl.dart';
import 'package:survey_frontend/data/datasources/survey_response_service_impl.dart';
import 'package:survey_frontend/domain/external_services/survey_response_service.dart';
import 'package:survey_frontend/domain/local_services/survey_participation_service.dart';
import 'package:survey_frontend/domain/usecases/token_provider.dart';
import 'package:survey_frontend/presentation/controllers/survey_end_controller.dart';

class SurveyEndBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyResponseService>(() => SurveyResponseServiceImpl(
        Get.find(),
        tokenProvider: Get.find<TokenProvider>()));
    Get.lazyPut(() => SurveyEndController(Get.find(), Get.find(), Get.find()));
    Get.lazyPut<SurveyParticipationService>(
        () => SurveyParticipationServiceImpl(Get.find()));
  }
}
