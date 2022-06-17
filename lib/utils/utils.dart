import 'package:get/get.dart';

showSnackbar({required String message, required Duration duration}) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    duration: duration,
  ));
}
