import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/constants/colors.dart';
import 'controller.dart';

class RecommendPage extends GetView<RecommendController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendController>(builder: (controller) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Podcast",
                style: PodcastFont.baseFont.copyWith(
                    color: Colors.deepPurple,
                    fontSize: 80,
                    fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.jpeg"),
                    fit: BoxFit.fill),
              ),
            ),
            Align(
              alignment: Alignment(0.9, -1.0),
              child: GestureDetector(
                onTap: () {
                  controller.toHome();
                },
                child: SafeArea(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  child: Obx(() => Text(
                        "跳过广告 ${controller.countdown.value}",
                        style:
                            PodcastFont.baseFont.copyWith(color: Colors.white),
                      )),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20)),
                )),
              ),
            )
          ],
        ),
      );
    });
  }
}
