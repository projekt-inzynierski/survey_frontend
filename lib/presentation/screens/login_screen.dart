import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 145,
                height: 145,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nazwa użytkownika",
                ),
                validator: controller.usernameValidator,
                onChanged: (value) {
                  controller.model.value.username = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Hasło",
                ),
                validator: controller.passwordValidator,
                obscureText: true,
                onChanged: (value) {
                  controller.model.value.password = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: controller.login,
                child: const Text('Zaloguj się'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
