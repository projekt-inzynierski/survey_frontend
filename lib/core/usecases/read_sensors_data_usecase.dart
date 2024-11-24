import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:survey_frontend/core/models/sensors_response.dart';

abstract class ReadSensorsDataUsecase {
  Future<SensorsResponse?> getSensorsData();
}

class ReadXiaomiSensorsDataUsecase implements ReadSensorsDataUsecase {
  @override
  Future<SensorsResponse?> getSensorsData() async {
    if (!await _hasAllRequiredPermissions()) {
      return null;
    }

    Completer<void> completer = Completer<void>();
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
    SensorsResponse? ret;
    FlutterBluePlus.scanResults.listen((results) async {
      for (final result in results) {
        if (result.device.platformName == "ATC_7B6E3E") {
          FlutterBluePlus.stopScan();
          ret = await _fromDevice(result.device);
          completer.complete();
          break;
        }
      }
    });

    await completer.future;
    return ret;
  }

  Future<SensorsResponse> _fromDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      List<BluetoothService> services = await device.discoverServices();
      final service = services[3];
      var tempCharacterictics = service.characteristics[0];
      var humidityCharacterictics = service.characteristics[1];
      final temList = await tempCharacterictics.read();
      final temp = _convertData(temList) * 10;
      final humidity = _convertData(await humidityCharacterictics.read());
      return SensorsResponse(temperature: temp, humidity: humidity);
    } finally {
      if (device.isConnected) {
        await device.disconnect();
      }
    }
  }

  double _convertData(List<int> rawData) {
    int value = rawData[0] | (rawData[1] << 8);
    return value / 100;
  }

  Future<bool> _hasAllRequiredPermissions() async {
    List<Permission> permissions = [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.locationAlways,
    ];

    List<PermissionStatus> statuses =
        await Future.wait(permissions.map((e) => e.status));

    return statuses.every((status) => status.isGranted);
  }
}
