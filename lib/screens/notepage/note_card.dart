import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstapp/model/noteM.dart';
import 'package:firstapp/screens/notepage/note_pageVM.dart';
import 'package:firstapp/screens/notepage/noteeditpage/edit_noteV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteCard extends StatelessWidget {
  final NotePageViewModel viewModel;
  final NoteModel model;
  final NoteCardViewModel noteCardViewModel = NoteCardViewModel();
  NoteCard({required this.model, required this.viewModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        await noteCardViewModel.onLongPressCard(model);
        // viewModel.refreshNotes();
      },
      onTap: () async {
        await Get.to(EditNote(model: model));
        // viewModel.refreshNotes();
      },
      child: Container(
        // width: Get.width*.4,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              model.title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                model.text,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              model.date,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

class NoteCardViewModel extends GetxController {
  Future<void> onLongPressCard(NoteModel model) async {
    await Get.dialog(AlertDialog(
      title: Text("Delete this note?"),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.red),
            )),
        TextButton(
            onPressed: () async {
              await deleteNote(model);
              Get.back();
            },
            child: const Text("Ok"))
      ],
    ));
  }

  Future<void> deleteNote(NoteModel model) async {
    String? email = FirebaseAuth.instance.currentUser!.email;
    var docRef = FirebaseFirestore.instance
        .collection("notes")
        .doc(email)
        .collection("note")
        .doc(model.documentId);
    var imageUrl = (await docRef.get()).get("imageUrl");
    await FirebaseStorage.instance.refFromURL(imageUrl).delete();
    await docRef.delete();
  }
}
