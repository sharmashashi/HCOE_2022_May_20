import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/services/firebase/firebase_authentication.dart';
import 'package:firstapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login() async {
    try {
      showSnackbar(message: "Loggin you in!", duration: Duration(hours: 1));
      await FirebaseEmailPasswordAuthentication.login(
          email: emailController.text, password: passwordController.text);
      Get.closeAllSnackbars();
      showSnackbar(
          message: "Successfully Logged in!", duration: Duration(seconds: 2));
    } on FirebaseAuthException catch (e) {
      Get.closeAllSnackbars();
      showSnackbar(message: e.code, duration: Duration(seconds: 2));
    }
  }
}
