import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstapp/model/noteM.dart';
import 'package:firstapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class EditNoteViewModel extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  NoteModel? noteModel;
  EditNoteViewModel(NoteModel noteModel) {
    this.noteModel = noteModel;
    titleController.text = noteModel.title;
    noteController.text = noteModel.text;
    _pickedImagePath = noteModel.imageUrl;
  }

  bool _fromFile = false;
  bool get fromFile => _fromFile;

  saveNote() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      showSnackbar(message: "Saving", duration: Duration(hours: 1));
      String imageUrl = "";
      if (_pickedImagePath.isNotEmpty) {
        File imageFile = File(_pickedImagePath);
        imageUrl = await uploadFile(imageFile);
      }
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
        "documentId": noteDocumentId,
        "imageUrl": imageUrl
      });
      Get.back(closeOverlays: true);
    }
  }

  Future<String> uploadFile(File file) async {
    String link = "";
    try {
      var reference = FirebaseStorage.instance
          .ref("/images/" + DateTime.now().toIso8601String() + ".png");
      UploadTask uploadTask = reference.putFile(file);

      var stream = uploadTask.asStream();
      stream.listen((event) {
        print(event.bytesTransferred * 100 / event.totalBytes);
      });
      await uploadTask.then((_) => null);
      link = await reference.getDownloadURL();
    } catch (e) {
      print(e);
    }
    print(link);
    return link;
  }

  String _pickedImagePath = "";
  String get pickedImagePath => _pickedImagePath;
  onImagePick() async {
    var picker = ImagePicker();
    var file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      _pickedImagePath = file.path;
      _fromFile = true;
      update();
    } else {
      showSnackbar(
          message: "Error picking image", duration: Duration(seconds: 2));
    }
  }

  closeSelectedImage() {
    _pickedImagePath = "";
    update();
  }
}
