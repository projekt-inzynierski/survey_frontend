import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerBase extends GetxController {
  final Connectivity _connectivity = Connectivity();

  Future<void> handleSomethingWentWrong(Object? error) async {
    await popup("Błąd", error.toString());
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
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      await Get.defaultDialog(
          title: "Error",
          middleText: "You don't have an internet connection. Try again later",
          confirm: const Text("Ok"));
      return false;
    }

    return true;
  }
}
