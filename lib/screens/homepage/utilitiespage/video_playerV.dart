import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_player/video_player.dart';

class LiteVideoPlayer extends StatelessWidget {
  LiteVideoPlayer({Key? key}) : super(key: key);
  final LiteVideoPlayerViewModel viewModel = LiteVideoPlayerViewModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiteVideoPlayerViewModel>(
        init: viewModel,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: _body(),
          );
        });
  }

  _body() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          VideoPlayer(viewModel.videoPlayerController),
          GestureDetector(
            onTap: () {
              viewModel.onVideoTap();
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          viewModel.showControl
              ? Positioned(bottom: 10, child: _controlUi())
              : SizedBox()
        ],
      ),
    );
  }

  _controlUi() {
    return Container(
      color: Colors.black12,
      width: Get.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    viewModel.isPlaying
                        ? viewModel.pauseVideo()
                        : viewModel.playVideo();
                  },
                  icon: Icon(
                    viewModel.playPauseIcon,
                    color: Colors.white,
                  ))
            ]),
        _progressUi()
      ]),
    );
  }

  _progressUi() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text(viewModel.parseDuration(viewModel.currentDuration)),
      Slider(
          // divisions: 5,
          min: 0.0,
          max: double.parse(viewModel.totalDuration.inSeconds.toString()),
          value: viewModel.sliderValue,
          onChanged: (value) {
            viewModel.onSliderChange(value);
          }),
      Text(viewModel.parseDuration(viewModel.totalDuration))
    ]);
  }
}

class LiteVideoPlayerViewModel extends GetxController {
  late VideoPlayerController videoPlayerController;
  double sliderValue = 0.0;

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  onSliderChange(double value) {
    sliderValue = value;
    videoPlayerController.seekTo(Duration(seconds: value.toInt()));
    update();
  }

  _init() async {
    videoPlayerController = VideoPlayerController.network(
        "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4");
    await videoPlayerController.initialize();
    totalDuration = videoPlayerController.value.duration;
    videoPlayerController.addListener(
      () async {
        currentDuration = await (videoPlayerController.position);
        sliderValue = double.parse(currentDuration!.inSeconds.toString());
        update();
      },
    );
    update();
  }

  bool showControl = true;
  onVideoTap() {
    showControl = !showControl;
    update();
  }

  playVideo() async {
    await videoPlayerController.play();
    playPauseIcon = Icons.pause;
    isPlaying = !isPlaying;
    update();
  }

  pauseVideo() async {
    await videoPlayerController.pause();
    playPauseIcon = Icons.play_arrow;
    isPlaying = !isPlaying;
    update();
  }

  IconData playPauseIcon = Icons.play_arrow;
  bool isPlaying = false;

  Duration totalDuration = Duration(seconds: 0);
  Duration? currentDuration = Duration(seconds: 0);

  String parseDuration(Duration? duration) {
    String retVal = "";

    int minutes = duration!.inSeconds ~/ 60;
    int second = duration.inSeconds % 60;
    retVal = (minutes < 10 ? "0" + minutes.toString() : minutes.toString()) +
        " : " +
        (second < 10 ? "0$second" : "$second");
    return retVal;
  }

  @override
  void onClose() async {
    await videoPlayerController.pause();
  }
}
