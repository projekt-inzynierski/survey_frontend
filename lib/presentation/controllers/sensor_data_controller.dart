import 'package:get/get.dart';

class SensorDataController {
  final Rx<SensorDataState> state = SensorDataState.scanning.obs;
}

enum SensorDataState {
  scanning, bluetoothTurnedOff, sensorNotFound, sensorFound
}