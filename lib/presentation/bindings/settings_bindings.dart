import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/settings_controller.dart';

class SettingsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }

}