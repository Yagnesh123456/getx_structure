import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_colors.dart';
import '../common_view/common_button.dart';
import 'controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: controller.setUsername,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200], // Background color
                  labelText: 'Username',
                  prefixText: 'Horse-Link/   ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                    borderSide: BorderSide.none, // Remove border side
                  ),
                ),
              ),
              SizedBox(height: 16),
              Obx(() => TextFormField(
                    onChanged: controller.setPassword,
                    obscureText: controller.obscureText.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.grey[200], // Background color
                      suffixIcon: IconButton(
                        onPressed: controller.toggleObscureText,
                        icon: Icon(controller.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), // Rounded border
                        borderSide: BorderSide.none, // Remove border side
                      ),
                    ),
                  )),
              SizedBox(height: 16),
              CommonButton(
                text: 'Login',
                color: AppColors.colorSecondary,
                textColor: AppColors.colorWhite,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(8.0),
                onPressed: () {
                  controller.navigateToDashboard();
                  // Your button onPressed logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


}
