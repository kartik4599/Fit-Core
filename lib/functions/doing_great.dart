import 'package:flutter/material.dart';

import '../colour.dart';

class DoingGreat extends StatelessWidget {
  const DoingGreat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: 120,
            margin: const EdgeInsets.only(top: 40),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 40,
                      offset: Offset(10, 10),
                      color: AppColor.gradientFirst.withOpacity(0.3)),
                  BoxShadow(
                      blurRadius: 40,
                      offset: Offset(-10, -10),
                      color: AppColor.gradientFirst.withOpacity(0.3))
                ]),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 0,
                  ),
                  width: 200,
                  height: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/grass.png"))),
                ),
                Expanded(child: Container())
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/run.png"),
                    fit: BoxFit.fitHeight)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 170, top: 55),
            width: double.maxFinite,
            height: 100,
            // color: Colors.amber.withOpacity(0.2),
            child: Column(
              children: [
                Text(
                  "You are doing great",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.homePageDetail),
                ),
                SizedBox(
                  height: 5,
                ),
                RichText(
                    text: TextSpan(
                        text: "keep it up\n",
                        style: TextStyle(
                            color: AppColor.homePagePlanColor, fontSize: 12),
                        children: [TextSpan(text: "stick to your plan")])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
