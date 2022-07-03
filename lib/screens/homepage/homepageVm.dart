import 'package:firstapp/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';

class HomePageViewModel extends GetxController {
  String _savedTime = "";
  String get savedTime => _savedTime;

  saveTime() async {
    String currentTime = DateTime.now().toIso8601String();
    await Hive.openBox("login_info");
    var box = Hive.box("login_info");
    await box.put("time", currentTime);
    showSnackbar(
        message: "Successfully saved time", duration: Duration(seconds: 2));
  }

  getSavedTime() async {
    await Hive.openBox("login_info");
    _savedTime = await Hive.box("login_info").get("time");
    update();
  }

  onGotoUtilPage() async {
    final LocalAuthentication localAuth = LocalAuthentication();
    bool canCheck = await localAuth.canCheckBiometrics;
    if (canCheck) {
      var biometricsList = await localAuth.getAvailableBiometrics();
      print(biometricsList);
      if (biometricsList.contains(BiometricType.fingerprint)) {
        await localAuth.authenticate(
            localizedReason: "Reson to authenticate",
            options: AuthenticationOptions(biometricOnly: true));
      } else {
        showSnackbar(
            message: "Fingerprint not available",
            duration: Duration(seconds: 2));
      }
    } else {
      showSnackbar(
          message: "Couldn't check biometrics!",
          duration: Duration(seconds: 2));
    }
  }
}
