import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:survey_frontend/domain/local_services/notification_service.dart';
import 'package:survey_frontend/presentation/screens/home/widgets/request.dart';

Future<void> askForPermissions() async {
  final statuses = await [
    Permission.bluetooth,
    Permission.bluetoothScan,
    Permission.bluetoothConnect,
    // Permission.locationAlways,
    // Permission.locationWhenInUse
  ].request();
  if (statuses.values.any((status) => !status.isGranted)) {
    await buildManyDenyDialog();
  }
  if (!await Permission.locationAlways.isGranted) {
    await buildLocationDenyDialog();
  }

  await Geolocator.requestPermission();
  await NotificationService.initialize();
}
