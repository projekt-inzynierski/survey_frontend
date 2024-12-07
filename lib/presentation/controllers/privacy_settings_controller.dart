import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';

class PrivacySettingsController extends ControllerBase {
  final GetStorage _storage;

  final RxBool enableTrackingLocation = false.obs;
  final Rx<TimeOfDay> timeFrom = const TimeOfDay(hour: 16, minute: 0).obs;
  final Rx<TimeOfDay> timeTo = const TimeOfDay(hour: 16, minute: 0).obs;

  PrivacySettingsController(this._storage);

  loadPrivacySettings() {
    timeFrom.value = _storage.read<TimeOfDay>('allowLocationTrackingFrom') ??
        const TimeOfDay(hour: 8, minute: 0);
    timeTo.value = _storage.read<TimeOfDay>('allowLocationTrackingTo') ??
        const TimeOfDay(hour: 22, minute: 0);
    enableTrackingLocation.value =
        _storage.read<bool>('enableTrackingLocation') ?? true;
  }

  save() {
    try {
      _storage.write('allowLocationTrackingFrom', timeFrom.value);
      _storage.write('allowLocationTrackingTo', timeTo.value);
      _storage.write('enableTrackingLocation', enableTrackingLocation.value);
      Get.back();
    } catch (e) {
      handleSomethingWentWrong(e);
    }
  }

  setTimeFrom(TimeOfDay newFrom) {
    if (_isLater(newFrom, const TimeOfDay(hour: 23, minute: 58))) {
      return;
    }

    timeFrom.value = newFrom;
    if (_isLater(timeFrom.value, timeTo.value)) {
      if (_isLater(newFrom, const TimeOfDay(hour: 22, minute: 59))) {
        timeTo.value = const TimeOfDay(hour: 23, minute: 59);
      } else {
        timeTo.value = TimeOfDay(
            hour: timeFrom.value.hour + 1, minute: timeFrom.value.minute);
      }
    }
  }

  setTimeTo(TimeOfDay newTo) {
  if (!_isLater(newTo, const TimeOfDay(hour: 0, minute: 1))) {
    return;
  }

  timeTo.value = newTo;
  if (!_isLater(timeTo.value, timeFrom.value)) {
    if (!_isLater(newTo, const TimeOfDay(hour: 1, minute: 0))) {
      timeFrom.value = const TimeOfDay(hour: 0, minute: 1);
    } else {
      timeFrom.value = TimeOfDay(
          hour: timeTo.value.hour - 1, minute: timeTo.value.minute);
    }
  }
}


  bool _isLater(TimeOfDay x, TimeOfDay y) {
    return (60 * x.hour + x.minute) > (60 * y.hour + y.minute);
  }
}
