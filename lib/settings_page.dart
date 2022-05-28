import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<Map> settingsMenuData = [
    {
      "title": "Network & internet",
      "subtitle": "Wifi, data usage, and hotspot"
    },
    {"title": "Connected Devices", "subtitle": "Bluetooth, Android Auto"},
    {"title": "Apps & Notifications", "subtitle": "Recent apps, default apps"}
  ];

  final List iconList = [Icons.wifi, Icons.devices, Icons.apps_outlined];

  final List colorList = [Colors.blue, Colors.green, Colors.amber.shade600];

  Widget loadingIndicator = CircularProgressIndicator();

  removeLoadingAfterDelay() async {
    print("Inside remove loading after delay function");
    await Future.delayed(Duration(seconds: 5));
    loadingIndicator = SizedBox();
    setState(() {});
  }

  @override
  void initState() {
    removeLoadingAfterDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar();
  }

  Widget _body() {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          child: Column(
            children: [ _searchBar(), _items()],
          ),
        ),
        Positioned(
          
          child: loadingIndicator)
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade600),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.search,
              color: Colors.blue.shade100,
            ),
          ),
          // SizedBox(width: 15,),
          Text(
            "Search settings",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _items() {
    return Column(
      children: [
        for (int i = 0; i < 30; i++)
          _menuItem(
              iconData: iconList.last,
              iconColor: colorList.last,
              title: settingsMenuData.last['title'],
              subtitle: settingsMenuData.last['subtitle']),
        for (int i = 0; i < iconList.length; i++)
          _menuItem(
            iconData: iconList[i],
            iconColor: colorList[i],
            title: (settingsMenuData[i])['title'],
            subtitle: (settingsMenuData[i])['subtitle'],
          )
      ],
    );
  }

  Widget _menuItem(
      {required IconData iconData,
      required Color iconColor,
      required String title,
      required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(shape: BoxShape.circle, color: iconColor),
            child: Icon(
              iconData,
              color: Colors.black,
            ),
          ),
          // SizedBox(
          //   width: 5,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 5,
              ),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
