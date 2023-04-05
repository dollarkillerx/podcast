import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/g_response.dart';
import '../../widgets/classification.dart';
import '../../widgets/recommend.dart';
import '../../widgets/search.dart';
import 'controller.dart';

class RecommendPage extends GetView<RecommendController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendController>(builder: (controller) {
      return Column(
        children: [
          SafeArea(
            child: SearchButton(
              texts: controller.searchs,
            ),
            bottom: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Classification(
              index: controller.classificationAction,
              onTap: () {
                controller.pageController.animateToPage(
                    controller.classificationAction.value,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
            ),
          ),
          Expanded(
              child: PageView(
            controller: controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            controller.carousel.elementAt(index),
                            fit: BoxFit.fill,
                          );
                        },
                        itemCount: controller.carousel.length,
                        pagination: SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              color: Colors.grey, activeColor: Colors.white),
                        ),
                        autoplay: true,
                        duration: 500,
                      ),
                    ),
                    Recommend(
                      recommends: RecommendModel.genFake(),
                    ),
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Text("有声小说"),
                ),
              ),
              Container(
                child: Center(
                  child: Text("逻辑思维"),
                ),
              ),
              Container(
                child: Center(
                  child: Text("点击榜单"),
                ),
              )
            ],
          ))
        ],
      );
    });
  }
}
