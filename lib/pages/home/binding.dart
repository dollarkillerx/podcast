import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';
import './pages/recommend/controller.dart';
import './pages/recommend/provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeProvider>(() => HomeProvider());


    Get.lazyPut<RecommendController>(() => RecommendController());
    Get.lazyPut<RecommendProvider>(() => RecommendProvider());
  }
}
