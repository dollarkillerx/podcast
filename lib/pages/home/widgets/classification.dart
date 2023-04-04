import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../models/g_response.dart';

class Classification extends StatefulWidget {
  RxInt index;
  List<ClassificationModel> classifications = ClassificationModel.genFake();

  Classification({Key? key, required this.index}) : super(key: key);

  @override
  State<Classification> createState() => _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      height: 38,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (content, index) {
            return GestureDetector(
              onTap: () {
                widget.index.value = index;
              },
              child: Obx(() => Container(
                    child: Text(
                      widget.classifications.elementAt(index).display,
                      style: PodcastFont.baseFont.copyWith(color: Colors.black),
                    ),
                    decoration: widget.index.value == index
                        ? BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 3.0, color: Colors.orange),
                            ),
                          )
                        : BoxDecoration(),
                  )),
            );
          },
          separatorBuilder: (content, index) => SizedBox(
                width: 10,
              ),
          itemCount: widget.classifications.length),
    );
  }
}
