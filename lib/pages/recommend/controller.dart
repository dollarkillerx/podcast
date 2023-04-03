import 'package:get/get.dart';
import 'package:podcast/common/routers/app_routes.dart';

class RecommendController extends GetxController {
  var countdown = 5.obs;

  @override
  void onInit() {
    super.onInit();
    _countdown();
  }

  Future<void> _countdown() async {
    for (var i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        countdown.value--;

        if (countdown.value == 0) {
          print("倒计时结束");
          toHome();
        }
      });
    }
  }

  toHome() {
    Get.toNamed(AppRoutes.Home);
  }
}
