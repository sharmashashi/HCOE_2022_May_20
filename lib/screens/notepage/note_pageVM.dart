import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/model/noteM.dart';
import 'package:firstapp/screens/notepage/noteeditpage/edit_noteV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotePageViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  logout() {
    FirebaseAuth.instance.signOut().then((value) {
      // Get.back();
      Get.offAndToNamed('/login');
    });
  }

  List<QueryDocumentSnapshot> _noteList = [];
  List<QueryDocumentSnapshot> get noteList => _noteList;
  Future<void> fetchNotes() async {
    DocumentReference userDocument = FirebaseFirestore.instance
        .collection("notes")
        .doc(FirebaseAuth.instance.currentUser!.email);

    var querySnapshot = await userDocument.collection("note").get();

    _noteList = querySnapshot.docs;
    update();
  }

  onAddNoteClicked() async {
    await Get.to(EditNote(
        model: NoteModel(text: "", title: "", date: "", documentId: "")));
    refreshNotes();
  }

  Future<void> refreshNotes() async {
    await fetchNotes();
  }
}
