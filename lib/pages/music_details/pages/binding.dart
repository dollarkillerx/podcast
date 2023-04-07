import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class MusicCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MusicCardController>(() => MusicCardController());
    Get.lazyPut<MusicCardProvider>(() => MusicCardProvider());
  }
}
