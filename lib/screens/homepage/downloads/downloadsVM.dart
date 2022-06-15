import 'dart:io';

import 'package:firstapp/utils/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DownloadsViewModel extends GetxController {
  @override
  void onInit() {
    listDownloadItems();
    super.onInit();
  }

  List<FileSystemEntity> _downloadedItemList = [];
  List<FileSystemEntity> get downloadedItemList => _downloadedItemList;
  void onDeleteItem(FileSystemEntity file) {
    file.deleteSync();
    listDownloadItems();
  }

  Future<void> listDownloadItems() async {
    Directory movieDir = Directory(FILE_DOWNLOAD_PATH);
    _downloadedItemList = movieDir.listSync();
    update();
  }
}
