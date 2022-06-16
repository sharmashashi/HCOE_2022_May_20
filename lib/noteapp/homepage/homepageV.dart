import 'package:firstapp/noteapp/homepage/homepageVM.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HomePageViewModel viewModel = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: TextButton(
        child: Text("Save"),
        onPressed: () {
          viewModel.saveDummyData();
        },
      )),
    );
  }
}
