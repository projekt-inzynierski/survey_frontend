import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/sensor_data_history_controller.dart';
import 'package:survey_frontend/presentation/controllers/settings_controller.dart';

class SettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => SensorDataHistoryController(Get.find()), fenix: true);
  }
}
