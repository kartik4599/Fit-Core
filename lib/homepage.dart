import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/bmi.dart';
import 'package:flutter_application_2/videoinfo.dart';
import 'colour.dart';
import 'functions/doing_great.dart';
import 'functions/homepagebar.dart';
import 'functions/homepageplay.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  int on = 1;
  late String name;

  _initData() {
    DefaultAssetBundle.of(context).loadString("assets/info.json").then((value) {
      setState(() {
        info = json.decoder.convert(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    if (on == 1) {
      name = "Glues";
    }
    if (on == 2) {
      name = "Abs";
    }
    if (on == 3) {
      name = "Legs";
    }
    if (on == 4) {
      name = "Arms";
    }
    if (on == 5) {
      name = "Back";
    }
    if (on == 6) {
      name = "Shoulder";
    }
    return Scaffold(
      backgroundColor: AppColor.homepageBackground,
      appBar: AppBar(
        backgroundColor: AppColor.homepageBackground,
        elevation: 0,
        titleSpacing: 30,
        title: Text(
          "Fit Core",
          style: TextStyle(
              fontSize: 30,
              color: AppColor.homePageTitle,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              HomePageBar(on: on),
              SizedBox(
                height: 20,
              ),
              HomePagePlay(name: name, on: on),
              const DoingGreat(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                // height: 50,
                child: Row(
                  children: [
                    Text(
                      "Calculate BMI",
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColor.homePagesubTitle,
                          fontWeight: FontWeight.w500),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Bmi()));
                      },
                      child: Text(
                        "BMI",
                        style: TextStyle(
                          fontSize: 24,
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
                                builder: (context) => const Bmi()));
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: AppColor.homePageIcons,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Area of foucs",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: AppColor.homePageTitle),
                  )
                ],
              ),
              Container(
                height: 700,
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: info.length,
                      itemBuilder: (_, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoInfo(
                                        input: info[i]['id'],
                                      )),
                            );
                            setState(() {
                              on = info[i]['id'];
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                              bottom: 2,
                            ),
                            margin: const EdgeInsets.only(
                                left: 20, bottom: 0, top: 15, right: 20),
                            height: 180,
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      info[i]['title'],
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.red),
                                    ),
                                    Text(
                                      "(${info[i]['week']})",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: AppColor.gradientSecond),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColor.gradientSecond
                                          .withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: const Offset(5, 5)),
                                  BoxShadow(
                                      color: AppColor.gradientSecond
                                          .withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: const Offset(-5, -5))
                                ],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(info[i]['img']))),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
