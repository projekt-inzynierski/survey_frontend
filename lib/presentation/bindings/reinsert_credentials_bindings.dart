import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/reinsert_credentials_controller.dart';

class ReinsertCredentialsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        ReinsertCredentialsController(Get.find(), Get.find(), Get.find()));
  }
}
