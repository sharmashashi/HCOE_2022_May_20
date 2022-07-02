import 'package:flutter/material.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({Key? key}) : super(key: key);

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  double containerSize = 300;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animationController.addListener(() {
      print(animationController.value);
      if (animationController.status == AnimationStatus.completed) {
        animationController.reverse();
      }
      if (animationController.status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: [
        AnimatedBuilder(
            animation: animationController,
            builder: (_, __) {
              var animationValue = animationController.value;
              return Container(
                  height: 100 + 200 * animationValue,
                  width: 100 + 200 * animationValue,
                  child: Hero(
                      tag: "tag", child: Image.asset("assets/pumdikot.png")));
            }),
        _btns()
      ],
    );
  }

  _animatedContainer() {
    return AnimatedContainer(
        height: containerSize,
        width: containerSize,
        duration: Duration(milliseconds: 500),
        child: Hero(tag: "tag", child: Image.asset("assets/pumdikot.png")));
  }

  _btns() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                containerSize = 300;
              });
            },
            icon: Icon(Icons.add)),
        IconButton(
            onPressed: () {
              setState(() {
                containerSize = 100;
              });
            },
            icon: Icon(Icons.remove)),
      ],
    );
  }
}
