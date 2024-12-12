import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/change_password_controller.dart';

class ChangePasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }

}