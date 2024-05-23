import 'package:get/get.dart';
import 'package:survey_frontend/data/datasources/health_condition_service_impl.dart';
import 'package:survey_frontend/data/datasources/medication_use_service_impl.dart';
import 'package:survey_frontend/domain/external_services/health_condition_service.dart';
import 'package:survey_frontend/domain/external_services/medication_use_service.dart';
import 'package:survey_frontend/presentation/controllers/insert_demographic_information_controller.dart';

class InsertDemographicInformationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HealthConditionService>(() => HealthConditionServiceImpl(Get.find()));
    Get.lazyPut<MedicationUseService>(() => MedicationUseServiceImpl(Get.find()));
    Get.lazyPut<InsertDemographicInformationController>(
      () => InsertDemographicInformationController(
        Get.find(),
        Get.find()
      ));
  }
}