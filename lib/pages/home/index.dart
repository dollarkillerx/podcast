import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                Scaffold(),
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
