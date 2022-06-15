import 'dart:io';

import 'package:firstapp/screens/homepage/downloads/downloadsVM.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Downloads extends StatelessWidget {
  Downloads({Key? key}) : super(key: key);
  final DownloadsViewModel viewModel = DownloadsViewModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DownloadsViewModel>(
        init: viewModel,
        builder: (_) {
          return SizedBox(
            height: Get.height,
            width: Get.width,
            child: _downloadList(),
          );
        });
  }

  _downloadList() {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
        await viewModel.listDownloadItems();
      },
      child: ListView(
        children: [
          for (var each in viewModel.downloadedItemList) _singleItem(file: each)
        ],
      ),
    );
  }

  _singleItem({required FileSystemEntity file}) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SelectableText(
                file.path,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "",
                style: TextStyle(fontSize: 10),
              )
            ]),
          ),
          IconButton(
              onPressed: () {
                viewModel.onDeleteItem(file);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
