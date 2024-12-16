import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/core/usecases/send_sensors_data_usecase.dart';
import 'package:survey_frontend/domain/external_services/location_service.dart';
import 'package:survey_frontend/domain/models/localization_data.dart';
import 'package:survey_frontend/presentation/bindings/initial_bindings.dart';

Future<bool> sendSensorsData(){
  var service = Get.find<SendSensorsDataUsecase>();
  return service.sendSensorsDataToTheServer();
}

Future<void> readLocation() async {
  GetStorage storage = Get.find();

  var locations = storage.read<List<dynamic>>('locations') ?? [];
  locations = locations.map((e) {
    if (e.runtimeType == LocalizationData){
      return e as LocalizationData;
    }

    return LocalizationData.fromJson(e);
  }).toList();

  final locationData = await _getCurrentPosition(storage);
  if (locationData != null){
    locations.add(locationData);
  }

  final service = Get.find<LocalizationService>();
  final toSubmit = locations.map((e) => e as LocalizationData).toList();
  final result = await service.submitLocations(toSubmit);
  if (result.statusCode == 201){
    for (var e in toSubmit) {
      locations.remove(e);
    }
  }

  await storage.write('locations', locations);
}

Future<LocalizationData?> _getCurrentPosition(GetStorage storage) async{
  if (!(storage.read('enableTrackingLocation') ?? true)){
    return null;
  }

  final timeFrom = storage.read<TimeOfDay>('allowLocationTrackingFrom') ??
        const TimeOfDay(hour: 8, minute: 0);
  final timeTo = storage.read<TimeOfDay>('allowLocationTrackingTo') ??
        const TimeOfDay(hour: 22, minute: 0);
  final now = DateTime.now();
  final nowTime = TimeOfDay(hour: now.hour, minute: now.minute);

  if (!_isBetween(nowTime, timeFrom, timeTo)){
    return null;
  }
  Position currentLocation = await Geolocator.getCurrentPosition();
  final locationData = LocalizationData(
        dateTime: now.toUtc().toIso8601String(),
        latitude: double.parse(currentLocation.latitude.toStringAsFixed(6)),
        longitude: double.parse(currentLocation.longitude.toStringAsFixed(6)));

  return locationData;
}

bool _isBetween(TimeOfDay time, TimeOfDay start, TimeOfDay end) {
  final startInMinutes = start.hour * 60 + start.minute;
  final endInMinutes = end.hour * 60 + end.minute;
  final timeInMinutes = time.hour * 60 + time.minute;

  if (startInMinutes < endInMinutes) {
    return timeInMinutes >= startInMinutes && timeInMinutes <= endInMinutes;
  } else {
    return timeInMinutes >= startInMinutes || timeInMinutes <= endInMinutes;
  }
}


void backgroundTask(String taskId) async{
  try{
    InitialBindings().dependencies();
    await sendSensorsData();
    await readLocation();
  } catch(e){ 
    //TODO: log the error
  } finally {
    if (taskId.isNotEmpty){
      BackgroundFetch.finish(taskId);
    }
  }
}