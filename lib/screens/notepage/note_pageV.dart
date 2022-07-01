import 'package:firstapp/model/noteM.dart';
import 'package:firstapp/screens/notepage/note_card.dart';
import 'package:firstapp/screens/notepage/note_pageVM.dart';
import 'package:firstapp/screens/notepage/noteeditpage/edit_noteV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotePage extends StatelessWidget {
  NotePage({Key? key}) : super(key: key);
  final NotePageViewModel viewModel = NotePageViewModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotePageViewModel>(
        init: viewModel,
        builder: (context) {
          return Scaffold(
            floatingActionButton: _floatingBtn(),
            appBar: _appBar(),
            body: RefreshIndicator(
              onRefresh: () async {
                await viewModel.refreshNotes();
              },
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                children: [
                  for (var each in viewModel.noteList)
                    NoteCard(
                      viewModel: viewModel,
                      model: each,
                    )
                ],
              ),
            ),
          );
        });
  }

  _appBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            viewModel.logout();
          },
          icon: Icon(Icons.logout),
          tooltip: "Logout",
        )
      ],
      title: Text("Your Notes"),
    );
  }

  _floatingBtn() {
    return FloatingActionButton(
        tooltip: "Add new note",
        backgroundColor: Colors.green,
        onPressed: () {
          viewModel.onAddNoteClicked();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ));
  }
}
