import 'package:get/get.dart';

showSnackbar({required String message,Duration? duration}) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    duration: duration??Duration(seconds: 2),
  ));
}
