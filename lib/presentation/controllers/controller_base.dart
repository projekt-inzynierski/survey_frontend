import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ControllerBase extends GetxController {
  final Connectivity connectivity = Connectivity();

  Future<void> handleSomethingWentWrong(Object? error) async {
    String message;

    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        message = AppLocalizations.of(Get.context!)!
            .couldNotReachTheServer;
      } else if (error.type == DioExceptionType.unknown &&
          error.error is SocketException) {
        message = AppLocalizations.of(Get.context!)!
            .couldNotReachTheServer;
      } else {
        message =
            AppLocalizations.of(Get.context!)!.somethingWentWrong;
      }
    } else {
      message =
          AppLocalizations.of(Get.context!)!.somethingWentWrong; 
    }

    await popup(AppLocalizations.of(Get.context!)!.error, message);
  }

  Future<void> popup(String title, String message) async {
    await Get.defaultDialog(
        title: title,
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
