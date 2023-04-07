import 'package:get/get.dart';
import 'package:podcast/services/audio_service.dart';

import '../../../models/g_homepage.dart';

class MusicCardController extends GetxController {
  Chapter chapter = Get.arguments['chapter'];
  String chapterImg = Get.arguments['chapterImg'];

  var isPlaying = false.obs;
  var duration = (0.0).obs;
  var position = (0.0).obs;
  var isLoading = true;

  @override
  void onReady() async {
    super.onReady();

    String? playUrl = AudioService().getPlayUrl();
    if (playUrl != chapter.playUrl) {
      await AudioService().stop();
      await AudioService().setPlayUrl(chapter.playUrl, chapterImg);
    }

    isPlaying.value = AudioService().playing();

    var dur = await AudioService().duration();
    if (dur != null) {
      duration.value = dur.inSeconds.toDouble();
    }

    var pos = AudioService().position();
    pos.listen((event) {
      if (event != null) {
        Duration tmp = event as Duration;
        position.value = tmp.inSeconds.toDouble();
      }
    });

    isLoading = false;
    update();
  }

  playMusic() {
    isPlaying.value = !isPlaying.value;
    if (isPlaying.value) {
      AudioService().play();
    }else {
      AudioService().pause();
    }
  }

  changeSlider(int val) {
    AudioService().seek(Duration(seconds: val));
  }
}
