import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/constants/colors.dart';
import 'package:podcast/models/g_response.dart';
import 'package:podcast/pages/home/widgets/classification.dart';
import 'package:podcast/pages/home/widgets/recommend.dart';
import 'package:podcast/pages/home/widgets/search.dart';
import '../../widgets/rimg.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      // return Scaffold(
      //   body: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         SafeArea(child: SearchButton(texts: ["有声书","知识书","音乐"],)),
      //         SizedBox(
      //           height: 200,
      //           child: Swiper(
      //             itemBuilder: (BuildContext context,int index){
      //               return Image.network(controller.carousel.elementAt(index),fit: BoxFit.fill,);
      //             },
      //             itemCount: controller.carousel.length,
      //             pagination: SwiperPagination(
      //               builder: DotSwiperPaginationBuilder(color: Colors.grey, activeColor: Colors.white),
      //             ),
      //             autoplay: true,
      //             duration: 500,
      //           ),
      //         ),
      //         Recommend(recommends: RecommendModel.genFake(),),
      //       ],
      //     ),
      //   ),
      // );
      return Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: SearchButton(
                texts: controller.searchs,
              ),
              bottom: false,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Classification(index: controller.classificationAction,),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          controller.carousel.elementAt(index),
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: controller.carousel.length,
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            color: Colors.grey, activeColor: Colors.white),
                      ),
                      autoplay: true,
                      duration: 500,
                    ),
                  ),
                  Recommend(
                    recommends: RecommendModel.genFake(),
                  ),
                ],
              ),
            ))
          ],
        ),
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
        // bottomNavigationBar: BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       IconButton(
        //         icon: Icon(Icons.home),
        //         onPressed: () {},
        //       ),
        //       SizedBox(),
        //       IconButton(
        //         icon: Icon(Icons.settings),
        //         onPressed: () {},
        //       ),
        //     ],
        //   ),
        // ),
        bottomNavigationBar: Obx(()=>BottomNavigationBar(
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
