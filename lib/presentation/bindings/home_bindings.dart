import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
