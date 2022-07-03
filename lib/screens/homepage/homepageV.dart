import 'package:firstapp/screens/homepage/detailed_page/detailed_pageV.dart';
import 'package:firstapp/screens/homepage/homepageVm.dart';
import 'package:firstapp/screens/homepage/locationpage/locationV.dart';
import 'package:firstapp/screens/homepage/utilitiespage/utilpage.dart';
import 'package:firstapp/widgets/slidable_imageV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageViewModel viewModel = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(
        init: viewModel,
        builder: (context) {
          return Scaffold(
            appBar: _appBar(),
            body: _body(),
          );
        });
  }

  _body() {
    return ListView(
      children: [
        Text(viewModel.savedTime),
        ElevatedButton(
            onPressed: () {
              viewModel.saveTime();
            },
            child: Text("Save time")),
        ElevatedButton(
            onPressed: () {
              viewModel.getSavedTime();
            },
            child: Text("Get time")),
        _placeCard(),
        ElevatedButton(
            onPressed: () {
              Get.to(SlidableImage());
            },
            child: Text("Go to image page")),
        ElevatedButton(
            onPressed: () {
              viewModel.onGotoUtilPage();
            },
            child: Text("Go to util page")),
        ElevatedButton(
            onPressed: () {
              Get.to(LocationPage());
            },
            child: Text("Go to location page"))
      ],
    );
  }

  _placeCard() {
    return GestureDetector(
      onTap: () {
        Get.to(DetailedPage());
      },
      child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          color: Colors.grey.shade200,
          child: Row(
            children: [
              Hero(
                tag: "tag",
                child: Image.asset(
                  "assets/pumdikot.png",
                  height: 80,
                  width: 80,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text("Place: Pumdikot")
            ],
          )),
    );
  }

  _appBar() {
    return AppBar();
  }
}
