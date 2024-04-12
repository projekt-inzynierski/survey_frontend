import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/presentation/controllers/archived_surveys_controller.dart';
import 'package:survey_frontend/presentation/controllers/pending_surveys_controller.dart';
import 'package:survey_frontend/presentation/controllers/respondent_data_controller.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RespondentDataController());
    Get.lazyPut(() => PendingSurveysController());
    Get.lazyPut(() => ArchivedSurveysController());
    Get.put(_getDio());
    Get.put(GetStorage());
  }

  Dio _getDio(){
    var dio = Dio();
    dio.options.baseUrl = "http://10.0.2.2:8080";
    return dio;
  }
}