import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/core/usecases/need_insert_respondent_data_usecase.dart';
import 'package:survey_frontend/core/usecases/need_insert_respondent_data_usecase_impl.dart';
import 'package:survey_frontend/core/usecases/token_provider_impl.dart';
import 'package:survey_frontend/core/usecases/token_validity_checker_impl.dart';
import 'package:survey_frontend/data/datasources/local/survey_participation_service_impl.dart';
import 'package:survey_frontend/data/datasources/respondent_data_service_impl.dart';
import 'package:survey_frontend/data/datasources/survey_service_impl.dart';
import 'package:survey_frontend/domain/external_services/respondent_date_service.dart';
import 'package:survey_frontend/domain/external_services/survey_service.dart';
import 'package:survey_frontend/domain/local_services/survey_participation_service.dart';
import 'package:survey_frontend/domain/usecases/token_provider.dart';
import 'package:survey_frontend/domain/usecases/token_validity_checker.dart';
import 'package:survey_frontend/presentation/controllers/archived_surveys_controller.dart';
import 'package:survey_frontend/presentation/controllers/respondent_data_controller.dart';
import 'package:survey_frontend/presentation/controllers/survey_question_controller.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RespondentDataController());
    Get.lazyPut(() => ArchivedSurveysController());
    Get.create<SurveyService>(() => SurveyServiceImpl(Get.find()));
    Get.create<SurveyQuestionController>(() => SurveyQuestionController(Get.find()));
    Get.put(_getDio());
    Get.put(GetStorage());
    TokenProvider tp = TokenProviderImpl(Get.find());
    Get.put<TokenProvider>(tp);
    Get.put<TokenProvider?>(tp);
    Get.lazyPut<SurveyParticipationService>(() => SurveyParticipationServiceImpl(Get.find()));
    Get.lazyPut<NeedInsertRespondentDataUseCase>(() => NeedInsertRespondentDataUseCaseImpl(
      Get.find(), 
      Get.find())
    );
    Get.lazyPut<TokenValidityChecker>(() => TokenValidityCheckerImpl());
    Get.lazyPut<RespondentDataService>(() => RespondentDataServiceImpl(
      Get.find(), 
      tokenProvider: Get.find<TokenProvider>()
    ));
  }

  Dio _getDio(){
    var dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080";
    return dio;
  }
}