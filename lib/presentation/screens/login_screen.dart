import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController>{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: controller.formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField( 
                  decoration: const InputDecoration(
                    labelText: "Username",
                  ),
                  validator: controller.usernameValidator,
                  onChanged: (value){controller.model.value.username = value;},
                  ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                  validator: controller.passwordValidator,
                  obscureText: true,
                  onChanged: (value){controller.model.value.password = value;},
                ),
                const SizedBox(height: 20,),
                GFButton(
                  onPressed: controller.login,
                  text: "Login",
                  blockButton: true,
                  type: GFButtonType.solid,
                  color: Theme.of(context).primaryColor
                  )
              ],),
        ),
      ),
    );
  }

}