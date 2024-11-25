import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/core/usecases/send_sensors_data_usecase.dart';
import 'package:survey_frontend/presentation/bindings/initial_bindings.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await GetStorage.init();
    InitialBindings().dependencies();
    if (task == BackgroundTasks.sensorsData) {
      return await sendSensorsData();
    }

    return true;
  });
}

Future<bool> sendSensorsData(){
  var service = Get.find<SendSensorsDataUsecase>();
  return service.sendSensorsDataToTheServer();
}

class BackgroundTasks{
  static String get sensorsData => "sensorsData";
  static String get sensorsDataId => "sensorsDataId";
}