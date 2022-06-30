import 'package:firstapp/model/noteM.dart';
import 'package:firstapp/screens/notepage/note_pageVM.dart';
import 'package:firstapp/screens/notepage/noteeditpage/edit_noteV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteCard extends StatelessWidget {
  final NotePageViewModel viewModel;
  final NoteModel model;
  NoteCard({required this.model, required this.viewModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.to(EditNote(model: model));
        viewModel.refreshNotes();
      },
      child: Container(
        // width: Get.width*.4,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: Flexible(
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
      ),
    );
  }
}
