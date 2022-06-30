import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePageViewModel extends GetxController {
  saveDummyData() {
    var firebaseInstance = FirebaseFirestore.instance;
    firebaseInstance
        .collection("new new id")
        .doc("new docid")
        .set({"somekey": "someValue"});
  }

  List<String> _dummyValues = [];
  List<String> get dummyValues => _dummyValues;

  getDummyData() async {
    var querySnapshots =
        await FirebaseFirestore.instance.collection("newid").get();
    for (QueryDocumentSnapshot each in querySnapshots.docs) {
      var value = each.get("somekey");
      _dummyValues.add(value);
    }
    update();
  }

  updateDummyData() {
    FirebaseFirestore.instance
        .collection("newid")
        .doc('docId')
        .update({'somekey': DateTime.now().toIso8601String()});
  }

  deleteDocument() {
    FirebaseFirestore.instance.collection('newid').doc('docId').delete();
  }
}
