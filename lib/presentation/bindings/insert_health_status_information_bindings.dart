import 'package:get/get.dart';
import 'package:survey_frontend/data/datasources/life_satisfaction_service_impl.dart';
import 'package:survey_frontend/data/datasources/quality_of_sleep_service_impl.dart';
import 'package:survey_frontend/data/datasources/stress_level_service_impl.dart';
import 'package:survey_frontend/domain/external_services/life_satisfaction_service.dart';
import 'package:survey_frontend/domain/external_services/quality_of_sleep_service.dart';
import 'package:survey_frontend/domain/external_services/stress_level_service.dart';
import 'package:survey_frontend/presentation/controllers/insert_health_status_information_controller.dart';

class InsertHealthStatusInformationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LifeSatisfactionService>(() => LifeSatisfactionServiceImpl(Get.find()));
    Get.lazyPut<StressLevelService>(() => StressLevelServiceImpl(Get.find()));
    Get.lazyPut<QualityOfSleepService>(() => QualityOfSleepServiceImpl(Get.find()));
    
    Get.lazyPut(() => InsertHealthStatusInformationController(
      Get.find(),
      Get.find(),
      Get.find()
    ));
  }
}