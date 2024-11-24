import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/core/usecases/read_sensors_data_usecase.dart';
import 'package:survey_frontend/data/models/sensor_kind.dart';
import 'package:survey_frontend/domain/external_services/sensors_data_service.dart';
import 'package:survey_frontend/domain/models/sensor_data.dart';

abstract class SendSensorsDataUsecase {
  Future<bool> sendSensorsDataToTheServer();
}

class SendSensorsDataUsecaseImpl extends SendSensorsDataUsecase {
  final GetStorage _storage;
  final SensorsDataService _service;

  SendSensorsDataUsecaseImpl(this._storage, this._service);

  @override
  Future<bool> sendSensorsDataToTheServer() async {
    try {
      final selectedSonsor = _storage.read<String>('selectedSensor');

      if (selectedSonsor == null || selectedSonsor == SensorKind.none) {
        return true;
      }

      var readSensorDataService =
          Get.find<ReadSensorsDataUsecase>(tag: selectedSonsor);
      var allSensorsData =
          _storage.read<List<Map<String, dynamic>>>('rememberedSensorsData');
      allSensorsData ??= [];
      var sensorsData = await readSensorDataService.getSensorsData();

      if (sensorsData != null) {
        final json = sensorsData.toJson();
        json['dateTime'] = DateTime.now().toUtc().toIso8601String();
        allSensorsData.add(json);
        _storage.write('rememberedSensorsData', allSensorsData);
      }

      final submitResult = await _service
          .create(allSensorsData.map((e) => SensorData.fromJson(e)).toList());

      if (submitResult.statusCode == 201) {
        _storage.remove('rememberedSensorsData');
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
