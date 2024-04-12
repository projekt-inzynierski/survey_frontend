import 'package:get/get.dart';
import 'package:survey_frontend/data/datasources/login_service_impl.dart';
import 'package:survey_frontend/domain/external_services/login_service.dart';
import 'package:survey_frontend/presentation/controllers/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginService>(() => LoginServiceImpl(
      Get.find()
    ));
    Get.lazyPut<LoginController>(() => LoginController(
      Get.find(),
      Get.find()
    ));
  }
}