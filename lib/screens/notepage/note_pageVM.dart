import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/model/noteM.dart';
import 'package:firstapp/screens/notepage/noteeditpage/edit_noteV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotePageViewModel extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  //   // fetchNotes();
  // }

  logout() {
    FirebaseAuth.instance.signOut().then((value) {
      // Get.back();
      Get.offAndToNamed('/login');
    });
  }

  List<NoteModel> _noteList = [];
  List<NoteModel> get noteList => _noteList;
  Future<void> fetchNotes() async {
    DocumentReference userDocument = FirebaseFirestore.instance
        .collection("notes")
        .doc(FirebaseAuth.instance.currentUser!.email);

    var querySnapshot = await userDocument.collection("note").get();

    // _noteList = querySnapshot.docs;
    List<NoteModel> tempList = [];

    for (var each in querySnapshot.docs) {
      String imageUrl = "";
      try {
        imageUrl = each.get('imageUrl');
      } catch (e) {
        print(e);
      }
      tempList.add(NoteModel(
          title: each.get('title'),
          text: each.get('text'),
          date: each.get('date'),
          imageUrl: imageUrl,
          documentId: each.get('documentId')));
    }
    _noteList = tempList;

    update();
  }

  onAddNoteClicked() async {
    await Get.to(EditNote(
        model: NoteModel(
            imageUrl: "", text: "", title: "", date: "", documentId: "")));
    // refreshNotes();
  }

  Future<void> refreshNotes() async {
    await fetchNotes();
  }

  Stream<QuerySnapshot> noteStream() {
    return FirebaseFirestore.instance
        .collection("notes")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("note")
        .snapshots();
  }

  parseNoteSnapshot(AsyncSnapshot<QuerySnapshot> snapshot) {
    List<NoteModel> tempList = [];

    for (var each in snapshot.data!.docs) {
      String imageUrl = "";
      try {
        imageUrl = each.get('imageUrl');
      } catch (e) {
        print(e);
      }
      tempList.add(NoteModel(
          title: each.get('title'),
          text: each.get('text'),
          date: each.get('date'),
          imageUrl: imageUrl,
          documentId: each.get('documentId')));
    }
    _noteList = tempList;

    // update();
  }
}
