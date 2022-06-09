import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieSuggestionCard extends StatelessWidget {
  const MovieSuggestionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: Get.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < 10; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset("assets/ronb.png"),
              ),
            )
        ],
      ),
    );
  }
}
