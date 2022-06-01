import 'package:get/get_state_manager/get_state_manager.dart';

class CounterAppViewModel extends GetxController {
  int _count = 0;
  int get count => _count;

  incrementCounter() {
    _count++;
    update();
  }
}
