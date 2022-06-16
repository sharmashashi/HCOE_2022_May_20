import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePageViewModel extends GetxController {
  saveDummyData() {
    var firebaseInstance = FirebaseFirestore.instance;
    firebaseInstance
        .collection("newid")
        .doc("docId")
        .set({"somekey": "someValue"});
  }
}
