import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:survey_frontend/core/models/sensors_response.dart';

abstract class ReadSensorsDataUsecase {
  Future<SensorsResponse?> getSensorsData();
}

class ReadXiaomiSensorsDataUsecase implements ReadSensorsDataUsecase {
  @override
  Future<SensorsResponse?> getSensorsData() async {
    Completer<void> completer = Completer<void>();
    SensorsResponse? ret;
    FlutterBlue.instance.scanResults.listen((results) async {
      for (final result in results) {
        if (result.device.name == "LYWSD03MMC") {
          FlutterBlue.instance.stopScan();
          if (!completer.isCompleted){
            ret = await _fromDevice(result.device);
            try{
              completer.complete();
            } catch (e){
              //ignore when already complited
            }
          }
          break;
        }
      }
    });
    await FlutterBlue.instance.startScan(timeout: const Duration(seconds: 30));


    await completer.future;
    return ret;
  }

  Future<SensorsResponse> _fromDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      List<BluetoothService> services = await device.discoverServices();
      final serviceGuid = Guid('ebe0ccb0-7a0a-4b0c-8a1a-6ff2997da3a6');
      final characteristicGuid = Guid('ebe0ccc1-7a0a-4b0c-8a1a-6ff2997da3a6');
      final service = services.firstWhere((e) => e.uuid == serviceGuid);
      final characteristic = await service.characteristics.firstWhere((e) => e.uuid == characteristicGuid).read();
      final temp = characteristic[0] + characteristic[1] * 256;
      final humidity = characteristic[2];
      return SensorsResponse(temperature: temp.toDouble() / 100, humidity: humidity.toDouble());
    } finally {
      await device.disconnect();
    }
  }
}
