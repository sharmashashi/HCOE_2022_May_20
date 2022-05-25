import 'package:flutter/material.dart';

class StackExample extends StatelessWidget {
  const StackExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          children: [


            Stack(children: [
              Text(
                'data',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 150,
                width: 150,
                color: Color.fromRGBO(220, 220, 220, 0.5),
              ),
              Positioned(child: Text("On top of the container"),
              bottom:2.5,
              )
            ]),


            Icon(Icons.people,size: 50,color: Colors.blue,),


            
          ],
        ),
      ),
    );
  }
}
