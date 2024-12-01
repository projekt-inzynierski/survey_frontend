import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:survey_frontend/presentation/static/routes.dart';

class SettingsController extends ControllerBase {
  void editSensor(){
    Get.toNamed(Routes.sensors);
  }

  void logout(){
    Get.toNamed(Routes.logoutConfirmation);
  }
}