import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:survey_frontend/presentation/controllers/sensors_controller.dart';

class SensorsBindings extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => SensorsController(
      Get.find()
    ));
  }

}