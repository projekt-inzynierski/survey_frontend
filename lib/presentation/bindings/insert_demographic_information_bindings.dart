import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/insert_demographic_information_controller.dart';

class InsertDemographicInformationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<InsertDemographicInformationController>(() => InsertDemographicInformationController());
  }
}