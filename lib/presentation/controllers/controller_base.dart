import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ControllerBase extends GetxController {
  final Connectivity connectivity = Connectivity();

  Future<void> handleSomethingWentWrong(Object? error) async {
    await popup(AppLocalizations.of(Get.context!)!.error, error.toString());
  }

  Future<void> popup(String title, String message) async {
    await Get.defaultDialog(
        title: message,
        middleText: message,
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Ok"),
        ));
  }

  Future<bool> hasInternetConnection() async {
    var connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      await Get.defaultDialog(
          title: AppLocalizations.of(Get.context!)!.error,
          middleText: AppLocalizations.of(Get.context!)!.noInternetConnection,
          confirm: const Text("Ok"));
      return false;
    }

    return true;
  }
}
