import 'package:file_picker/file_picker.dart';
import 'package:firstapp/screens/homepage/utilitiespage/video_playerV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Utilpage extends StatefulWidget {
  const Utilpage({Key? key}) : super(key: key);

  @override
  State<Utilpage> createState() => _UtilpageState();
}

class _UtilpageState extends State<Utilpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      children: [
        ElevatedButton(
            onPressed: () {
              launchUrl(Uri.parse("https://google.com"));
            },
            child: Text("Open Website")),
        ElevatedButton(
            onPressed: () {
              launchUrl(Uri.parse("tel:test"));
            },
            child: Text("Open phone")),
        ElevatedButton(
            onPressed: () {
              launchUrl(Uri.parse("sms:test"));
            },
            child: Text("Open sms")),
        ElevatedButton(
            onPressed: () {
              launchUrl(Uri.parse("mailto:test"));
            },
            child: Text("Open email")),
        ElevatedButton(
            onPressed: () async {
              var result = await FilePicker.platform.pickFiles();
              if (result != null) {
                print(result.files.single.path);
              }
            },
            child: Text("pick file")),
        ElevatedButton(
            onPressed: () async {
              Get.to(LiteVideoPlayer());
            },
            child: Text("open video")),
        ElevatedButton(
            onPressed: () async {
              Share.share("Text to be shared",subject: "Subject");
            },
            child: Text("open Share dialog"))
      ],
    );
  }
}
