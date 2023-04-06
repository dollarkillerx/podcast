import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/pages/home/pages/recommend/provider.dart';

class RecommendController extends GetxController {
  var classificationAction = 0.obs;
  var loading = true.obs;

  var carousel = [
    "https://imagev2.xmcdn.com/storages/a8c8-audiofreehighqps/43/B2/GMCoOSIH_DZVAAtXuwIJFC7H.png",
    "https://imagev2.xmcdn.com/storages/784a-audiofreehighqps/30/A5/GKwRIJIH_DmDAAENGQIJFXOG.jpg",
    "https://imagev2.xmcdn.com/storages/fff2-audiofreehighqps/75/CF/GMCoOSUH_DdnAAHH0wIJFLJM.jpg"
  ];

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
  void onReady() {
    super.onReady();
  }

}
