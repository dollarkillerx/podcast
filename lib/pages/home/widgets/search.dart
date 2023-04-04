import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/marquee_widget.dart';

class SearchButton extends StatefulWidget {
  final List<String> texts;
  const SearchButton({Key? key, required this.texts}) : super(key: key);

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height:50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search),
          SizedBox(width: 10,),
          Expanded(child: _buildMarqueeWidget(widget.texts)),
          Icon(Icons.mic)
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)
      ),
    );
  }

  MarqueeWidget _buildMarqueeWidget(List<String> loopList) {
    ///上下轮播 安全提示
    return MarqueeWidget(
      //子Item构建器
      itemBuilder: (BuildContext context, int index) {
        String itemStr = loopList[index];
        //通常可以是一个 Text文本
        return Container(
          child: Text(itemStr, style: TextStyle(
            fontSize: 18,
          )),
          alignment: Alignment.centerLeft,
        );
      },
      //循环的提示消息数量
      count: loopList.length,
      loopSeconds: 2,
    );
  }
}
