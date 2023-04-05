import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class RecommendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecommendController>(() => RecommendController());
    Get.lazyPut<RecommendProvider>(() => RecommendProvider());
  }
}
