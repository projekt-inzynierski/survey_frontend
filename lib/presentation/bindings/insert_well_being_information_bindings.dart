import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/insert_well_being_information_controller.dart';

class InsertWellBeingInformationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InsertWellBeingInformationController(Get.find(), Get.find()));
  }
}