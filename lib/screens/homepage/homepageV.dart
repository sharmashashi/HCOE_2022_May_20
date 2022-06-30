import 'package:firstapp/screens/homepage/homepageVM.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HomePageViewModel viewModel = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(
        init: viewModel,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
                child: ListView(
              children: [
                TextButton(
                  child: Text("Save"),
                  onPressed: () {
                    viewModel.saveDummyData();
                  },
                ),
                TextButton(
                  child: Text("Get data"),
                  onPressed: () {
                    viewModel.getDummyData();
                  },
                ),
                Column(
                  children: [
                    for (var each in viewModel.dummyValues) Text(each)
                  ],
                ),
                 TextButton(
                  child: Text("Update data"),
                  onPressed: () {
                    viewModel.updateDummyData();
                  },
                ),
                 TextButton(
                  child: Text("delete data"),
                  onPressed: () {
                    viewModel.deleteDocument();
                  },
                ),
              ],
            )),
          );
        });
  }
}
