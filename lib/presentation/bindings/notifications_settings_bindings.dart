import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/notifications_settings_controller.dart';

class NotificationsSettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsSettingsController(Get.find(), Get.find()));
  }
}
