import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/insert_health_status_information_controller.dart';

class InsertHealthStatusInformationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InsertHealthStatusInformationController());
  }
}