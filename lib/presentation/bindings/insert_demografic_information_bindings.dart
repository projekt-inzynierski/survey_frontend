import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/insert_demografic_information_controller.dart';

class InsertDemograficInformationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<InsertDemograficInformationController>(() => InsertDemograficInformationController());
  }
}