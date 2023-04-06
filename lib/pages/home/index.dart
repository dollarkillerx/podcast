import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/common/library/parse.dart';
import '../../widgets/rimg.dart';
import './pages/recommend/index.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: Obx(() => IndexedStack(
              index: controller.navigationBarAction.value,
              children: [
                RecommendPage(),
                Scaffold(
                  body: Center(child: Text(decodeString("104*116*116*112*115*58*47*47*109*112*51*46*116*105*110*103*50*55*53*46*99*111*109*47*49*51*51*52*53*95*55*52*49*57*51*49*57*48*47*54*48*57*50*56*49*53*53*54*46*109*52*97"))),
                ),
              ],
            )),
        floatingActionButton: Container(
          width: 70,
          height: 70,
          child: RIMGWidget(
              "https://imagev2.xmcdn.com/group47/M05/53/60/wKgKk1ufEHXxZnLQAAKdqZFMMEU542.jpg"),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.orange,
          ),
          clipBehavior: Clip.antiAlias,
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              selectedFontSize: 15,
              unselectedFontSize: 15,
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              currentIndex: controller.navigationBarAction.value,
              onTap: (idx) {
                controller.navigationBarAction.value = idx;
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '首页',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  label: '我的',
                ),
              ],
            )),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      );
    });
  }
}
