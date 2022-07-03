import 'package:firstapp/screens/homepage/locationpage/locationVM.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LocationPage extends StatelessWidget {
  LocationPage({Key? key}) : super(key: key);
  final LocationPageViewModel viewModel = LocationPageViewModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationPageViewModel>(
      init: viewModel,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          body: _body(),
        );
      }
    );
  }

  _body() {
    return ListView(
      children: [
        Text(viewModel.location),
        ElevatedButton(
            onPressed: () {
              viewModel.onLocationClick();
            },
            child: Text("Get location"))
      ],
    );
  }
}
