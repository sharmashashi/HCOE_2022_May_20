import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SlidableImage extends StatelessWidget {
  SlidableImage({Key? key}) : super(key: key);
  final SlidableImageViewModel viewModel = SlidableImageViewModel();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SlidableImageViewModel>(
        init: viewModel,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: _body(),
          );
        });
  }

  _body() {
    return Column(
      children: [
        Flexible(
          flex: 3,
          child: PageView(
            controller: viewModel.pageController,
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.asset("assets/pumdikot.png"),
              ),
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.asset("assets/ronb.png"),
              )
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Transform.scale(
            scale: 2,
            // angle: pi/3,
            child: ElevatedButton(
                onPressed: () {
                  viewModel.cancelSubscription();
                },
                child: Text("Stop")),
          ),
        )
      ],
    );
  }
}

class SlidableImageViewModel extends GetxController {
  PageController pageController = PageController();
  late StreamSubscription subscription;
  @override
  void onInit() {
    _init();
    super.onInit();
  }

  _init() async {
    var stream = Stream.periodic(Duration(seconds: 1));
    subscription = stream.listen((event) {
      pageController.nextPage(
          duration: Duration(seconds: 1), curve: Curves.linear);
      if (pageController.page == 1.0) {
        pageController.animateToPage(0,
            duration: Duration(seconds: 1), curve: Curves.linear);
      }
    });

    // while (true) {
    //   await Future.delayed(Duration(seconds: 1));
    //   pageController.nextPage(
    //       duration: Duration(seconds: 1), curve: Curves.linear);
    //   if (pageController.page == 1.0) {
    //     pageController.animateToPage(0,
    //         duration: Duration(seconds: 1), curve: Curves.linear);
    //   }
    // }
  }

  cancelSubscription() {
    try {
      subscription.cancel();
    } catch (e) {}
  }
}
