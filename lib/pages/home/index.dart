import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(child: _search()),
            ],
          ),
        ),
      );
    });
  }

  Widget _search() {
    return Container(
      child: Row(
        children: [

        ],
      ),
    );
  }
}
