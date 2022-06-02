import 'package:firstapp/feeds/feed_cardVM.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FeedCard extends StatelessWidget {
  FeedCard({Key? key}) : super(key: key);

  final FeedCardViewModel viewModel = FeedCardViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(1, 1),
                spreadRadius: 0.1,
                blurRadius: 1)
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: _pageDetails(),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: _statusBuilder()),
          _statusImgae(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: _reactionsBuilder(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1.5,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: _actionButtons())
        ],
      ),
    );
  }

  _pageDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/ronb.png",
              width: 50,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Routine of Nepal banda"),
                Row(
                  children: [
                    Text("Mon at 07:01 AM"),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 3,
                      width: 3,
                      color: Colors.grey,
                    ),
                    Icon(Icons.public)
                  ],
                )
              ],
            ),
          ],
        ),
        Icon(Icons.more_horiz)
      ],
    );
  }

  _statusBuilder() {
    final _status =
        "Monday morning and Statue of Lord Shiva at Pumdikot, Kaski. \u2764 ";
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Text(_status),
    );
  }

  _statusImgae() {
    return Image.asset("assets/pumdikot.png");
  }

  _reactionsBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_reactions(), _commentAndShare()],
      ),
    );
  }

  _actionButtons() {
    return GetBuilder<FeedCardViewModel>(
      init: viewModel,
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _singleActionButton(
                iconData: Icons.thumb_up_outlined,
                btnName: "Like",
                btnColor: viewModel.liked ? Colors.blue : Colors.grey,
                onTap: () {
                  viewModel.onLikeClicked();
                }),
            _singleActionButton(
              btnColor: Colors.grey,
                iconData: Icons.comment, btnName: "Comment", onTap: () {}),
            _singleActionButton(
              btnColor: Colors.grey,
                iconData: Icons.send, btnName: "Share", onTap: () {}),
          ],
        );
      }
    );
  }

  _reactions() {
    return Row(
      children: [
        Icon(Icons.favorite_outlined),
        Icon(Icons.thumb_up),
        GetBuilder<FeedCardViewModel>(
            init: viewModel,
            builder: (context) {
              return Text("${viewModel.reactionCount}K");
            })
      ],
    );
  }

  _commentAndShare() {
    return Row(
      children: [
        Text("305 comments"),
        Container(
          height: 2,
          width: 2,
          color: Colors.grey,
        ),
        Text("116 shares")
      ],
    );
  }

  _singleActionButton(
      {required IconData iconData,
      required String btnName,
      required Color btnColor,
      required Function onTap}) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Row(
          children: [
            Icon(iconData, color: btnColor),
            Text(btnName,style:TextStyle(color: btnColor))
          ],
        ));
  }
}
