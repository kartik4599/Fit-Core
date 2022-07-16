import 'package:flutter/material.dart';

import '../colour.dart';
import '../videoinfo.dart';

class HomePageBar extends StatelessWidget {
  const HomePageBar({
    Key? key,
    required this.on,
  }) : super(key: key);

  final int on;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Your program",
          style: TextStyle(
              fontSize: 20,
              color: AppColor.homePagesubTitle,
              fontWeight: FontWeight.w500),
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
          child: Text(
            "Details",
            style: TextStyle(
              fontSize: 20,
              color: AppColor.homePageDetail,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoInfo(
                          input: on,
                        )));
          },
          child: Icon(
            Icons.arrow_forward,
            size: 20,
            color: AppColor.homePageIcons,
          ),
        )
      ],
    );
  }
}
