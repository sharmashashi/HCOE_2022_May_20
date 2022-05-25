import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({Key? key}) : super(key: key);
final imageSource = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallup.net%2Fwp-content%2Fuploads%2F2014%2F10%2Fnature%2FMountain_Landscape_HD.jpg&f=1&nofb=1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Image.network(imageSource,
          height: 100,
          fit:BoxFit.cover
          ),
          for (int i = 0; i < 100; i++) Text(i.toString())],
      ),

      // body: Column(
      //   children: [
      //     for(int i=0;i<500;i++)Text(i.toString())
      //   ],
      // ),
    );

    
  }
}
