import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Image.asset(
          'assets/logo.png',
          width: 145,
          height: 145,),
        const Text('Potrzebujemy kilku informacji o Tobie',
        style: TextStyle(fontSize: 25),
        textAlign: TextAlign.center,),
        ElevatedButton(
          onPressed: (){
            Get.toNamed('/insertdemograficinformation');
          }, 
          child: const Text('Zaczynamy'))
      ],),
    );
  }
}