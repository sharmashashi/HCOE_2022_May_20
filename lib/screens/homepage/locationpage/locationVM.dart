import 'package:firstapp/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:location/location.dart';

class LocationPageViewModel extends GetxController {
  String _currentLocation = "empty";
  String get location => _currentLocation;

  onLocationClick() async {
    Location _location = Location();

    bool serviceEnabled = false;
    serviceEnabled = await _location.serviceEnabled();
    if (serviceEnabled) {
      var status = await _location.hasPermission();
      if (status == PermissionStatus.granted) {
        var locationData = await _location.getLocation();
        _currentLocation = locationData.latitude.toString() +
            ", " +
            locationData.longitude.toString();
        update();
      } else {
        _location.requestPermission();
      }
    } else {
      showSnackbar(message: "Location is not enabled!");
      await _location.requestService();
    }
  }
}
