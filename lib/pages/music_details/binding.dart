import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class MusicDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MusicDetailsController>(() => MusicDetailsController());
    Get.lazyPut<MusicDetailsProvider>(() => MusicDetailsProvider());
  }
}
