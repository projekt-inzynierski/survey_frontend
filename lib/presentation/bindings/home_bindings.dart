import 'package:get/get.dart';
import 'package:survey_frontend/data/datasources/home_service_impl.dart';
import 'package:survey_frontend/domain/external_services/home_service.dart';
import 'package:survey_frontend/presentation/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeService>(() => HomeServiceImpl(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
