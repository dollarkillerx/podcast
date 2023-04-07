import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/pages/music_details/provider.dart';
import '../../models/g_homepage.dart';
import '../../models/g_response.dart';

class MusicDetailsController extends GetxController {
  BookLetter bookLetter = Get.arguments['bookLetter'];
  ChapterResponse? chapterResponse;
  var toOld = false.obs;

  MusicDetailsProvider provider = Get.find();

  @override
  void onReady() async {
    super.onReady();

    // ChapterResponse
    await loadData();

  }

  loadData() async {
    GResponse gResponse = await provider.chapter(bookLetter.id, !toOld.value, 0);
    if (gResponse.GetError() != null) {
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text(gResponse.GetError()!.message),
      ));
      return;
    }

    if (gResponse.GetData() != null) {
      ChapterResponse ds = ChapterResponse.fromJson(gResponse.GetData()!);
      chapterResponse = ds;
    }

    update();
  }
}
