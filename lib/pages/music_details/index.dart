import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/common/routers/app_routes.dart';
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
                          SizedBox(
                            child: Text(
                              controller.bookLetter.title,
                              style: PodcastFont.baseFont.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            width: Get.width - 100,
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
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        controller.bookLetter.subTitle,
                        style: PodcastFont.baseFont
                            .copyWith(fontSize: 20, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "选集",
                          style: PodcastFont.baseFont,
                        ),
                      ),
                      Obx(() => Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.toOld.value =
                                        !controller.toOld.value;

                                    controller.loadData();
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.move_up_outlined,
                                          size: 20,
                                        ),
                                        Text(
                                          controller.toOld.value
                                              ? "从新到旧"
                                              : "从旧到新",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                      ),
                                      Text(
                                        "共 ${controller.bookLetter.episode} 集",
                                        style: PodcastFont.baseFont
                                            .copyWith(fontSize: 20),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      controller.chapterResponse != null
                          ? Container(
                              child: Column(
                                children: [
                                  ...controller.chapterResponse!.chapters
                                      .map((e) => InkWell(
                                            onTap: () {
                                              Get.toNamed(AppRoutes.MusicCard,
                                                  arguments: {
                                                    'chapterImg': controller
                                                        .bookLetter.img,
                                                    'chapter': e,
                                                  });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              padding: EdgeInsets.all(10),
                                              // height: 80,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(e.index.toString()),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        child: Text(
                                                          e.title,
                                                          style: PodcastFont
                                                              .baseFont
                                                              .copyWith(
                                                                  fontSize: 18),
                                                        ),
                                                        width: Get.width - 150,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(Icons
                                                              .play_arrow_rounded),
                                                          SizedBox(width: 10),
                                                          Text(formatNum(
                                                              e.views)),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                          ))
                                ],
                              ),
                            )
                          : SizedBox(),
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
