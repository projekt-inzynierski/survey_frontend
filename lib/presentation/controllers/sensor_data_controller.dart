import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:survey_frontend/core/models/sensors_response.dart';
import 'package:survey_frontend/core/usecases/sensor_connection.dart';
import 'package:survey_frontend/core/usecases/sensor_connection_factory.dart';

class SensorDataController {
  final Rx<SensorDataState> state = SensorDataState.initial.obs;
  final Rx<SensorsResponse?> sensorResponse = Rx<SensorsResponse?>(null);
  final SensorConnectionFactory _sensorConnectionFactory;
  SensorConnection? _currentConnection;

  SensorDataController(this._sensorConnectionFactory);

  void startScanning() async {
    if (state.value == SensorDataState.scanning) {
      return;
    }

    try {
      state.value = SensorDataState.scanning;
      await disconnect();
      _currentConnection = await _sensorConnectionFactory
          .getSensorConnection(const Duration(seconds: 60));
      state.value = SensorDataState.sensorFound;
      startReadingValueInBackground();
    } on SensorNotFoundExcetion catch (_) {
      state.value = SensorDataState.sensorNotFound;
    } on BluetoothTurnedOffException catch (_) {
      state.value = SensorDataState.bluetoothTurnedOff;
    } on SensorNotSpecifiedExeption catch (_) {
      state.value = SensorDataState.sensorNotSpecified;
    } catch (e) {
      state.value = SensorDataState.error;
      Sentry.captureException(e);
    }
  }

  void startReadingValueInBackground() async {
    while (_currentConnection != null) {
      try {
        sensorResponse.value = await _currentConnection!.getSensorData();
        await Future.delayed(const Duration(seconds: 5));
      } catch (e) {
        Sentry.captureException(e);
        state.value = SensorDataState.error;
        await disconnect();
      }
    }
  }

  Future<void> disconnect() async {
    if (_currentConnection != null) {
      await _currentConnection!.dispose();
      _currentConnection = null;
      sensorResponse.value = null;
    }
  }
}

enum SensorDataState {
  initial,
  scanning,
  bluetoothTurnedOff,
  sensorNotFound,
  sensorNotSpecified,
  sensorFound,
  error
}
