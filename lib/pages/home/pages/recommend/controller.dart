import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/models/g_homepage.dart';
import 'package:podcast/pages/home/pages/recommend/provider.dart';

import '../../../../models/g_response.dart';

class RecommendController extends GetxController {
  var classificationAction = 0.obs;
  var loading = true.obs;
  HomePageResponse? popular; // 热门 页数据
  HomePageResponse? crosstalk; // 相声 页数据


  var subClassification = [
    "推荐",
    "热点🔥",
    "有声小说",
    "逻辑思维",
    "德云社",
  ];

  var searchs = [
    "推荐",
    "热点🔥",
    "有声小说",
    "逻辑思维",
    "德云社",
  ];

  var pageController = PageController(initialPage: 0);

  RecommendProvider provider = Get.find();

  @override
  void onReady() async {
    super.onReady();

    GResponse gResponse = await provider.homePage("Popular");
    if (gResponse.GetError() != null) {
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text(gResponse.GetError()!.message),
      ));
      return;
    }

    if (gResponse.GetData() != null) {
      HomePageResponse ds = HomePageResponse.fromJson(gResponse.GetData()!);
      popular = ds;
      // update();
    }

    GResponse gResponse2 = await provider.homePage("Crosstalk");
    if (gResponse2.GetError() != null) {
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text(gResponse2.GetError()!.message),
      ));
      return;
    }

    if (gResponse2.GetData() != null) {
      HomePageResponse ds = HomePageResponse.fromJson(gResponse2.GetData()!);
      crosstalk = ds;
    }


    loading.value = false;
    update();
  }
}
