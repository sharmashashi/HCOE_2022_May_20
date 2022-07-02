import 'package:firstapp/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';

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
}
