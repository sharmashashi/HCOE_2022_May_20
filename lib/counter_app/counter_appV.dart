import 'package:firstapp/counter_app/counter_appVM.dart';
import 'package:firstapp/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CounterApp extends StatelessWidget {
  CounterAppViewModel viewModel = CounterAppViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          // child: Icon(Icons.add),
          child: GetBuilder<CounterAppViewModel>(
              init: viewModel,
              builder: (context) {
                return Text(viewModel.count.toString());
              }),
          onPressed: () {
            viewModel.incrementCounter();
          },
        ),
        appBar: AppBar(
          title: Text('Counter'),
        ),
        body: Column(
          children: [
            Center(
              child: GetBuilder<CounterAppViewModel>(
                  init: viewModel,
                  builder: (_) {
                    return Text(viewModel.count.toString(),
                        style: TextStyle(fontSize: 20));
                  }),
            ),
            _dialogButton()
          ],
        ));
  }

  _dialogButton() {
    return ElevatedButton(
        onPressed: () {
          Get.dialog(AlertDialog(
            title: Text("Alert!"),
            actions: [
              Icon(
                Icons.delete,
              ),
              Icon(Icons.save)
            ],
          ));
          Get.showSnackbar(GetSnackBar());
        },
        child: Text("Show dialog"));
  }
}
