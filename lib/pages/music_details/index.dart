import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/constants/colors.dart';
import '../../common/library/parse.dart';
import 'controller.dart';

class MusicDetailsPage extends GetView<MusicDetailsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicDetailsController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.network(controller.bookLetter.img,
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.bookLetter.title,
                            style: PodcastFont.baseFont,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 25,
                              ),
                              Text(controller.bookLetter.score.toString(),
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey,
                                      fontSize: 25))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text(
                              controller.bookLetter.end ? "完结" : "连载",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "总集数：${controller.bookLetter.episode}",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                size: 30,
                              ),
                              Text(
                                formatNum(controller.bookLetter.views),
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "简介",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Text(
                        controller.bookLetter.subTitle,
                        style: PodcastFont.baseFont
                            .copyWith(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
