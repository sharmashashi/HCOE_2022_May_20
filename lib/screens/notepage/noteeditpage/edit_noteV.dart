import 'package:firstapp/model/noteM.dart';
import 'package:firstapp/screens/notepage/noteeditpage/edit_noteVM.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNote extends StatelessWidget {
  final NoteModel model;
  EditNote({Key? key, required this.model}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditNoteViewModel>(
        init: EditNoteViewModel(model),
        builder: (vm) {
          return Scaffold(
            appBar: _appBar(),
            body: _body(vm),
          );
        });
  }

  _body(EditNoteViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _textField(
              controller: viewModel.titleController,
              maxLines: 1,
              hint: "Title"),
          _textField(
              controller: viewModel.noteController,
              maxLines: 3,
              hint: "Type your note here"),
          _saveBtn(viewModel)
        ],
      ),
    );
  }

  _saveBtn(EditNoteViewModel viewModel) {
    return MaterialButton(
      onPressed: () {
        viewModel.saveNote();
      },
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.save,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Save",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: Text("Edit Your Note"),
    );
  }

  _textField(
      {required TextEditingController controller,
      required int maxLines,
      required String hint}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade200,
          focusedBorder: border,
          enabledBorder: border,
          enabled: true,
          border: border,
        ),
      ),
    );
  }
}
