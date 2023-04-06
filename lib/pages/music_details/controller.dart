import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../models/g_homepage.dart';

class MusicDetailsController extends GetxController {
  BookLetter bookLetter = Get.arguments['bookLetter'];

  @override
  void onReady() {
    super.onReady();

    // showModalBottomSheet(
    //     shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.horizontal(
    //       left: Radius.circular(8),
    //       right: Radius.circular(8),
    //     )),
    //     context: Get.context!,
    //     builder: (context) {
    //       return Container(
    //         height: 500,
    //         color: Colors.green,
    //       );
    //     });
  }
}
