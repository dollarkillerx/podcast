import 'package:flutter/material.dart';
import 'package:podcast/common/library/parse.dart';
import 'package:podcast/constants/colors.dart';
import 'package:get/get.dart';

import '../../../models/g_homepage.dart';
import '../../../models/g_response.dart';

// 小编推荐

class Recommend extends StatelessWidget {
  final String title;
  final Box box;
  final BoxArrangement boxArrangement;

  const Recommend(
      {Key? key,
      required this.title,
      required this.box,
      this.boxArrangement = BoxArrangement.Horizontal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: PodcastFont.baseFont.copyWith(fontWeight: FontWeight.w100),
          ),
          SizedBox(
            height: 5,
          ),
          boxArrangement == BoxArrangement.Vertical
              ? GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  shrinkWrap: true,
                  itemCount: box.books.length,
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    // return Container(
                    //   child: Center(
                    //     // 852 - 393
                    //     child: Text("${MediaQuery.of(context).size.height} \n ${MediaQuery.of(context).size.width} "),
                    //   ),
                    //   color: Colors.green,
                    // );

                    return Stack(
                      children: [
                        Container(
                          child: Image.network(
                            box.books.elementAt(index).img,
                            fit: BoxFit.cover,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          clipBehavior: Clip.antiAlias,
                        ),
                        Align(
                          child: Container(
                            child: Text(
                              box.books.elementAt(index).title,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          alignment: Alignment.topCenter,
                        ),
                        Align(
                          child: Container(
                            child: Text(
                              box.books.elementAt(index).end ? "完结" : "连载",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          alignment: Alignment.bottomRight,
                        ),
                        Align(
                          child: Container(
                            child: Text(
                              formatNum(box.books.elementAt(index).views),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          alignment: Alignment.bottomLeft,
                        ),
                        // Text("data")
                      ],
                    );
                  },
                )
              : Column(
                  children: [...box.books.map((e) => _recommendCard(e))],
                )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget _recommendCard(BookLetter bookLetter) {
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
              bookLetter.img,
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
                bookLetter.title,
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
                  Text(bookLetter.score.toString(),
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis, color: Colors.grey)),
                  Text(" | "),
                  SizedBox(
                    width: 180,
                    child: Text(
                      bookLetter.subTitle,
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
                      backgroundImage: NetworkImage(bookLetter.author.avatar),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(bookLetter.author.name),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

/**
    Column(
    children: [
    Container(
    child: Stack(
    children: [
    Container(
    child: Image.network(
    box.books.elementAt(index).img,
    fit: BoxFit.cover,
    ),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10)
    ),
    clipBehavior: Clip.antiAlias,
    ),
    Align(
    child: Container(
    child: Row(
    children: [
    Icon(
    Icons.play_arrow_rounded,
    color: Colors.white,
    ),
    Text(
    formatNum(
    box.books.elementAt(index).views),
    style: TextStyle(
    color: Colors.white,
    ),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    ),
    decoration: BoxDecoration(
    color: Colors.grey.withOpacity(0.5),
    borderRadius: BorderRadius.circular(15),
    ),
    width: 100,
    ),
    alignment: Alignment.bottomLeft,
    )
    ],
    ),
    height: 180,
    color: Colors.green,
    ),
    box.books.elementAt(index).end
    ? Container(
    child: Text("完本"),
    decoration: BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.symmetric(
    horizontal: 5, vertical: 1),
    )
    : SizedBox(),
    ],
    )
 */
