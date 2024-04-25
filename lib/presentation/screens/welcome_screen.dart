import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/welcome_screen_controller.dart';

class WelcomeScreen extends GetView<WelcomeScreenConroller> {
  const WelcomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset(
            'assets/logo.png',
            width: 145,
            height: 145,),
          const SizedBox(height: 10,),
          const Text('Potrzebujemy kilku informacji o Tobie',
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: controller.letsGo, 
            child: const Text('Zaczynamy'))
        ],),
      ),
    );
  }
}