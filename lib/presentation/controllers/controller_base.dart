import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerBase extends GetxController{
  Future<void> handleSomethingWentWrong(Object error) async{
    await Get.defaultDialog(
        title: "Error",
        middleText: "Something went wrong. Try again later",
        confirm: const Text("Ok")
      );
  }
}