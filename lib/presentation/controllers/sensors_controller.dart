import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:survey_frontend/data/models/sensor_kind.dart';
import 'package:survey_frontend/domain/external_services/sensor_mac_service.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SensorsController extends ControllerBase {
  final Rx<String> selectedSensor = Rx<String>(SensorKind.none);
  Rx<int?> kestrelId = Rx<int?>(null);
  Rx<String?> xiaomiId = Rx<String?>(null);
  Rx<String?> xiaomiMac = Rx<String?>(null);
  final GetStorage _storage;
  final SensorMacService _sensorService;
  final RxBool loadingMac = false.obs;
  final RxBool loadingMacFailed = false.obs;
  final RxBool macNotFound = false.obs;
  late TextEditingController xiaomiMacController;
  late FocusNode xiaomiFocusNode;
  bool get canSave =>
      selectedSensor.value != SensorKind.xiaomi ||
      (!loadingMac.value && !loadingMacFailed.value && macNotFound.value);

  SensorsController(this._storage, this._sensorService) {
    _loadSelectedSensor();
  }

  final List<String> possibleOptions = [
    SensorKind.none,
    SensorKind.xiaomi,
    SensorKind.kestrelDrop2
  ];

  final Map<String, String> optionsDisplays = {
    SensorKind.none: AppLocalizations.of(Get.context!)!.noSensor,
    SensorKind.xiaomi: AppLocalizations.of(Get.context!)!.xiaomiSensor,
    SensorKind.kestrelDrop2: AppLocalizations.of(Get.context!)!.kestrelDrop2
  };

  @override
  void onInit() {
    super.onInit();
    xiaomiMacController = TextEditingController(text: xiaomiMac.value);
    xiaomiFocusNode = FocusNode();

    xiaomiMac.listen((value) {
      xiaomiMacController.text = value ?? '';
    });

    xiaomiFocusNode.addListener(() {
      if (!xiaomiFocusNode.hasFocus) {
        getXiaomiMac();
      }
    });
  }

  @override
  void onClose() {
    xiaomiMacController.dispose();
    super.onClose();
  }

  void getXiaomiMac() async {
    if (loadingMac.value) return;
    loadingMac.value = true;
    loadingMacFailed.value = false;
    macNotFound.value = false;
    try {
      if (xiaomiId.value == null || xiaomiId.value!.isEmpty) {
        xiaomiMac.value = null;
        return;
      }
      final result = await _sensorService.getMacAddress(xiaomiId.value!);

      if (result.statusCode == 404) {
        macNotFound.value = true;
        xiaomiMac.value = null;
        return;
      }

      if (result.statusCode == 200) {
        xiaomiMac.value = result.body;
        return;
      }
      loadingMacFailed.value = true;
    } on Exception catch (e) {
      loadingMacFailed.value = true;
      Sentry.captureException(e);
    } finally {
      loadingMac.value = false;
    }
  }

  void _loadSelectedSensor() {
    try {
      selectedSensor.value = _storage.read("selectedSensor") ?? SensorKind.none;
      if (selectedSensor.value == SensorKind.xiaomi) {
        xiaomiId.value = _storage.read("selectedSensorId");
        xiaomiMac.value = _storage.read("xiaomiMac");
      }
      if (selectedSensor.value == SensorKind.kestrelDrop2) {
        kestrelId.value = _storage.read("selectedSensorId");
      }
    } on Exception catch (e) {
      Sentry.captureException(e);
    }
  }

  void saveSelectedSensor() {
    if (!canSave) {
      return;
    }

    _storage.write("selectedSensor", selectedSensor.value);
    if (selectedSensor.value == SensorKind.kestrelDrop2) {
      _storage.write('selectedSensorId', kestrelId.value.toString());
    }
    if (selectedSensor.value == SensorKind.xiaomi) {
      _storage.write('selectedSensorId', xiaomiId.value);
      _storage.write('xiaomiMac', xiaomiId.value);
    }
    Get.offAllNamed('/home');
  }
}
