import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:podcast/constants/colors.dart';
import '../../../common/library/parse.dart';
import 'controller.dart';

class MusicCardPage extends GetView<MusicCardController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicCardController>(builder: (controller) {
      return Scaffold(
        body: Container(
          child: controller.isLoading
              ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SpinKitSquareCircle(
                          color: Colors.greenAccent,
                          size: 100.0,
                        ),
                      ),
                      Text("网络加载ing", style: PodcastFont.baseFont,),
                    ],
                  ),
                )
              : Column(
                  children: [
                    SafeArea(
                      child: SizedBox(),
                      bottom: false,
                    ),
                    Container(
                      child: Image.network(controller.chapterImg),
                    ),
                    Text(
                      controller.chapter.title,
                      style: PodcastFont.baseFont,
                      textAlign: TextAlign.center,
                    ),
                    Obx(
                      () => Slider(
                          min: 0,
                          max: controller.duration.value,
                          value: controller.position.value,
                          onChanged: (value) {
                            controller.changeSlider(value.toInt());
                          }),
                    ),
                    Obx(() => Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${formatSecondsToMinutes(controller.duration.value.toInt())}"),
                              Text(
                                  "${formatSecondsToMinutes(controller.position.value.toInt())}"),
                            ],
                          ),
                        )),
                    Obx(() => IconButton(
                          onPressed: () {
                            controller.playMusic();
                          },
                          icon: controller.isPlaying.value
                              ? Icon(Icons.pause_circle_outline)
                              : Icon(Icons.play_arrow_outlined),
                          iconSize: 50,
                        ))
                  ],
                ),
        ),
      );
    });
  }
}
