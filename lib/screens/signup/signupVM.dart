import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/services/firebase/firebase_authentication.dart';
import 'package:firstapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignupViewModel extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void signup() async {
    var isValidated = _validate();
    if (isValidated) {
      if (passwordController.text == confirmPasswordController.text) {
        try {
          showSnackbar(
              message: "Creating your account", duration: Duration(hours: 1));
          await FirebaseEmailPasswordAuthentication.createAccount(
              email: emailController.text, password: passwordController.text);
          Get.back();
          Get.closeAllSnackbars();
        } on FirebaseAuthException catch (e) {
          Get.closeAllSnackbars();

          showSnackbar(message: e.code, duration: Duration(seconds: 2));
        }
      } else {
        showSnackbar(
            message: "Password does not match!",
            duration: Duration(seconds: 2));
      }
    }
  }

  bool _validate() {
    bool retVal = false;
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      showSnackbar(
          message: "Please fill all fields", duration: Duration(seconds: 2));
    } else {
      retVal = true;
    }
    return retVal;
  }
}
