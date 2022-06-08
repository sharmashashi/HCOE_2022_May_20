import 'package:firstapp/screens/homepage/coming_soon/coming_soonVM.dart';
import 'package:firstapp/screens/homepage/detailed_page/detailed_pageV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComingSoon extends StatelessWidget {
  ComingSoon({Key? key}) : super(key: key);

  final ComingSoonViewModel viewModel = ComingSoonViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Colors.transparent,
        height: Get.height * .3,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_title(), _movieList()],
        ));
  }

  _title() {
    return Text("Coming Soon",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16));
  }

  _movieList() {
    return GetBuilder<ComingSoonViewModel>(
        init: viewModel,
        builder: (context) {
          return Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                viewModel.loading,
                for (var each in viewModel.movieList)
                  GestureDetector(
                    onTap: () {
                      Get.to(DetailedPage(
                       model: each,
                      ));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(each.imageUrl),
                    ),
                  )
              ],
            ),
          );
        });
  }
}
