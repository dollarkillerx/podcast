import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/models/g_homepage.dart';
import '../../widgets/classification.dart';
import '../../widgets/recommend.dart';
import '../../widgets/search.dart';
import 'controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

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
          Obx(() {
            if (controller.loading.value) {
              return Expanded(
                  child: Center(
                child: SpinKitFadingCube(color: Colors.greenAccent, size: 80.0),
              ));
            } else {
              return Expanded(
                  child: PageView(
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _rendering(controller.popular!),
                  _rendering(controller.crosstalk!),
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
              ));
            }
          })
        ],
      );
    });
  }

  Widget _rendering(HomePageResponse hpr) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (hpr.carousel
                            .elementAt(index)
                            .jumpType ==
                        JumpType.InApp) {
                    } else if (hpr.carousel
                            .elementAt(index)
                            .jumpType ==
                        JumpType.Web) {
                      launchUrl(Uri.parse(hpr.carousel
                          .elementAt(index)
                          .jumpUrl));
                    }
                  },
                  child: Image.network(
                    hpr.carousel.elementAt(index).img,
                    fit: BoxFit.fill,
                  ),
                );
              },
              itemCount: hpr.carousel.length,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    color: Colors.grey, activeColor: Colors.white),
              ),
              autoplay: true,
              duration: 500,
            ),
          ),
          ...hpr.boxs.map((e) => Recommend(
                title: e.title,
                box: e,
                boxArrangement: e.arrangement,
              ))
        ],
      ),
    );
  }
}
