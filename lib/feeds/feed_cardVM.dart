import 'package:get/get_state_manager/get_state_manager.dart';

class FeedCardViewModel extends GetxController {
  int _reactionCount = 20;
  int get reactionCount => _reactionCount;

  bool _liked = false;
  bool get liked => _liked;

  onLikeClicked() {
    if (_liked == false) {
      _reactionCount++;
      _liked = true;
      update();
    } else {
      _reactionCount--;
      _liked = false;
      update();
    }
  }
}
