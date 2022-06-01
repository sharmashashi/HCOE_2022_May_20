import 'package:flutter/material.dart';

class ExpandedMenu extends StatelessWidget {
  const ExpandedMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text("Some Text",style: TextStyle(color: Colors.white),),
    );
  }
}