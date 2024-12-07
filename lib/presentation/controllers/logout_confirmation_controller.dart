import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_frontend/data/datasources/local/database_service.dart';
import 'package:survey_frontend/presentation/controllers/controller_base.dart';
import 'package:survey_frontend/presentation/static/routes.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogoutConfirmationController extends ControllerBase {
  final GetStorage _storage;
  final DatabaseHelper _databaseHelper;
  Rx<bool> isBusy = false.obs;

  LogoutConfirmationController(this._storage, this._databaseHelper);

  void logOut() async {
    if (isBusy.value) {
      return;
    }

    try {
      await _storage.erase();
      await _databaseHelper.clearAllTables();
      await Workmanager().cancelAll();
      await FlutterLocalNotificationsPlugin().cancelAll();

      Get.offAllNamed(Routes.login);
    } catch (e) {
      //TODO: log the error
      await popup(AppLocalizations.of(Get.context!)!.error,
          AppLocalizations.of(Get.context!)!.couldNotLogout);
    } finally {
      isBusy.value = false;
    }
  }
}