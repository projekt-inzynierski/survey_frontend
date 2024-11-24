import 'package:survey_frontend/core/models/sensors_response.dart';

abstract class ReadSensorsDataUsecase 
{
   Future<SensorsResponse?> getSensorsData();
}

class ReadXiaomiSensorsDataUsecase implements ReadSensorsDataUsecase{
  @override
  Future<SensorsResponse?> getSensorsData() {
    return Future.value(SensorsResponse(temperature: 5, humidity: 50));
    // TODO: implement getSensorsData
    throw UnimplementedError();
  }

}