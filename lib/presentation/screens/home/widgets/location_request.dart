import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/l10n/get_localizations.dart';

Future<void> buildDenyDialog() async {
  return showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        title: Text(getAppLocalizations().locationPermissionDenied),
        content: Text(getAppLocalizations().locationPermissionDeniedMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(getAppLocalizations().close),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await Geolocator.openAppSettings();
            },
            child: Text(getAppLocalizations().openSettings),
          )
        ],
      );
    },
  );
}
