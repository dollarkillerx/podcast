import 'package:flutter/material.dart';
import 'package:podcast/constants/colors.dart';
import 'package:get/get.dart';

import '../../../models/g_response.dart';

// 小编推荐

class Recommend extends StatelessWidget {
  final List<RecommendModel> recommends;

  const Recommend({Key? key, required this.recommends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "小编推荐",
            style: PodcastFont.baseFont.copyWith(fontWeight: FontWeight.w100),
          ),
          // _recommendCard(recommends.elementAt(0))
          ...recommends.map((e) => _recommendCard(e))
        ],
      ),
    );
  }

  Widget _recommendCard(RecommendModel recommendModel) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      // color: Colors.grey,
      // height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.network(
              recommendModel.img,
              fit: BoxFit.fill,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recommendModel.title,
                style: TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                maxLines: 2,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Text(recommendModel.score,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis, color: Colors.grey)),
                  Text(" | "),
                  SizedBox(
                    width: 180,
                    child: Text(
                      recommendModel.subTitle,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis, color: Colors.grey),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(recommendModel.authorImg),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(recommendModel.author),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
