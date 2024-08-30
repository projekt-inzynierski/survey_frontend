import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/loading_controller.dart';

class LoadingBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoadingController(
      Get.find(), 
      Get.find(),
      Get.find()
    ));
  }
}