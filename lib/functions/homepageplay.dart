import 'package:flutter/material.dart';

import '../colour.dart';
import '../videoinfo.dart';

class HomePagePlay extends StatelessWidget {
  const HomePagePlay({
    Key? key,
    required this.name,
    required this.on,
  }) : super(key: key);

  final String name;
  final int on;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(10, 10),
                blurRadius: 10,
                color: AppColor.gradientSecond.withOpacity(0.5))
          ],
          gradient: LinearGradient(colors: [
            AppColor.gradientFirst.withOpacity(0.8),
            AppColor.gradientSecond.withOpacity(0.9)
          ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(1),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(100))),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your program",
              style: TextStyle(
                fontSize: 16,
                color: AppColor.homePageContainerTextSmall,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 30,
                color: AppColor.homePageContainerTextSmall,
              ),
            ),
            Text(
              "Exercise",
              style: TextStyle(
                fontSize: 30,
                color: AppColor.homePageContainerTextSmall,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      color: AppColor.homePageContainerTextSmall,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "60 min",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.homePageContainerTextSmall,
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoInfo(
                                  input: on,
                                )));
                  },
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 20,
                          color: AppColor.gradientFirst)
                    ]),
                    child: Icon(
                      Icons.play_circle_fill,
                      color: AppColor.homePageContainerTextSmall,
                      size: 50,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
