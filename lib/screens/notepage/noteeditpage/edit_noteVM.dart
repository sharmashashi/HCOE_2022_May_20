import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/model/noteM.dart';
import 'package:firstapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EditNoteViewModel extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  NoteModel? noteModel;
  EditNoteViewModel(NoteModel noteModel) {
    this.noteModel = noteModel;
    titleController.text = noteModel.title;
    noteController.text = noteModel.text;
  }

  saveNote() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      showSnackbar(message: "Saving", duration: Duration(hours: 1));
      var email = user.email;
      String noteDocumentId = noteModel!.documentId.isNotEmpty
          ? noteModel!.documentId
          : DateTime.now().toIso8601String();
      await FirebaseFirestore.instance
          .collection("notes")
          .doc(email)
          .collection("note")
          .doc(noteDocumentId)
          .set({
        "title": titleController.text,
        "text": noteController.text,
        "date": DateTime.now().toIso8601String(),
        "documentId": noteDocumentId
      });
      Get.back(closeOverlays: true);
    }
  }
}
