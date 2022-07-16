import 'package:flutter/material.dart';
import 'colour.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  final _controller = ScrollController();
  bool iscal = false;
  double num = 0;
  bool ishealth = false;
  bool isOver = false;
  @override
  void dispose() {
    height.dispose();
    weight.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homepageBackground,
      appBar: AppBar(
        foregroundColor: AppColor.homePageTitle,
        iconTheme: const IconThemeData(size: 30),
        backgroundColor: AppColor.homepageBackground,
        elevation: 0,
        titleSpacing: 10,
        title: Text(
          "BMI",
          style: TextStyle(
              fontSize: 30,
              color: AppColor.homePageTitle,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              space(20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(10, 10),
                          blurRadius: 20,
                          color: AppColor.gradientSecond.withOpacity(0.8))
                    ],
                    gradient: LinearGradient(colors: [
                      AppColor.gradientFirst.withOpacity(0.8),
                      AppColor.gradientSecond
                    ], begin: Alignment.centerLeft, end: Alignment.bottomRight),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(1),
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(150))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    space(50),
                    Text(
                      "Body Mass Index",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColor.homePageContainerTextSmall
                              .withOpacity(0.9)),
                    ),
                    space(30),
                    Text(
                      "Enter Your Height",
                      style: TextStyle(
                          fontSize: 30,
                          color: AppColor.homePageContainerTextSmall),
                    ),
                    space(20),
                    TextField(
                      style: TextStyle(
                          color: AppColor.homePageContainerTextSmall,
                          fontSize: 18),
                      controller: height,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "(centimetre)",
                          hoverColor: AppColor.gradientFirst,
                          hintStyle: TextStyle(
                              color: AppColor.homePageContainerTextSmall
                                  .withOpacity(0.5))),
                    ),
                    space(50),
                    Text(
                      "Enter Your Weight",
                      style: TextStyle(
                          fontSize: 30,
                          color: AppColor.homePageContainerTextSmall),
                    ),
                    space(20),
                    TextField(
                      style: TextStyle(
                          color: AppColor.homePageContainerTextSmall,
                          fontSize: 18),
                      controller: weight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "(Kg)",
                          hoverColor: AppColor.gradientFirst,
                          fillColor: AppColor.homePageContainerTextSmall,
                          hintStyle: TextStyle(
                              color: AppColor.homePageContainerTextSmall
                                  .withOpacity(0.5))),
                    ),
                    space(50),
                    InkWell(
                      onTap: () {
                        if (height.text.isNotEmpty || weight.text.isNotEmpty) {
                          num = calculate(double.parse(height.text),
                              double.parse(weight.text));
                          if (num > 18.5 && num < 25) {
                            setState(() {
                              iscal = true;
                              ishealth = true;
                              isOver = false;
                              _controller.animateTo(600,
                                  duration: const Duration(milliseconds: 1500),
                                  curve: Curves.easeIn);
                            });
                          } else if (num > 25) {
                            setState(() {
                              iscal = true;
                              ishealth = false;
                              isOver = true;
                              _controller.animateTo(600,
                                  duration: const Duration(milliseconds: 1500),
                                  curve: Curves.easeIn);
                            });
                          } else if (num < 18.5) {
                            setState(() {
                              iscal = true;
                              ishealth = false;
                              isOver = false;
                              _controller.animateTo(600,
                                  duration: const Duration(milliseconds: 1500),
                                  curve: Curves.easeIn);
                            });
                          }
                          ;
                        }
                      },
                      child: Container(
                        height: 45,
                        width: 150,
                        decoration: BoxDecoration(
                            color: AppColor.gradientSecond,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color:
                                      AppColor.gradientFirst.withOpacity(0.5),
                                  offset: const Offset(10, 10))
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColor.homePageContainerTextSmall,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              iscal
                  ? Container(
                      // height: 730,
                      width: MediaQuery.of(context).size.width,
                      decoration: ishealth
                          ? BoxDecoration(
                              boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(10, 10),
                                      blurRadius: 20,
                                      color: Colors.green.withOpacity(0.5))
                                ],
                              gradient: LinearGradient(
                                  colors: [Colors.green, Colors.green.shade200],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(1),
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(150)))
                          : isOver
                              ? BoxDecoration(
                                  boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(10, 10),
                                          blurRadius: 20,
                                          color: Colors.red.withOpacity(0.8))
                                    ],
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.red.withOpacity(0.9),
                                        Colors.yellow.withOpacity(0.9)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(1),
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(150)))
                              : BoxDecoration(
                                  boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(10, 10),
                                          blurRadius: 20,
                                          color: Colors.amber.withOpacity(0.8))
                                    ],
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.amber.withOpacity(0.9),
                                        Colors.orange.withOpacity(0.9)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(1),
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(150))),
                      child: ishealth
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                space(20),
                                Image.asset(
                                  "assets/healthydiet.png",
                                  height: 250,
                                ),
                                healthIndicator(
                                    "BMI : ${num.toStringAsFixed(2)}"),
                                healthIndicator("You Are Healthy"),
                                space(10),
                                QuickTips(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1.Eat Healthy food to Maintain Weight.",
                                        style: rule(),
                                      ),
                                      space(10),
                                      Text(
                                          "2.Eat 2-3 hours before going to sleep.",
                                          style: rule()),
                                      space(10),
                                      Text("3.Dont eat too much saturated fat.",
                                          style: rule()),
                                      space(10),
                                      Text(
                                          "4.Avoid aerated and artificially sweetened drinks..",
                                          style: rule()),
                                      space(10),
                                      Text(
                                          "5.DO Daily Exercise recommended by Fit Core",
                                          style: rule()),
                                    ],
                                  ),
                                )
                              ],
                            )
                          : isOver
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    space(20),
                                    Image.asset(
                                      "assets/lightdiet.png",
                                      height: 250,
                                    ),
                                    healthIndicator(
                                        "BMI : ${num.toStringAsFixed(2)}"),
                                    healthIndicator("You Are Over Weight"),
                                    space(10),
                                    QuickTips(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 30.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "1.Eat more vegetables - add them at every meal.",
                                            style: rule(),
                                          ),
                                          space(10),
                                          Text(
                                              "2.Drink plenty of water - you can become hungry when thirsty.",
                                              style: rule()),
                                          space(10),
                                          Text(
                                              "3.Try eating off smaller plates so as to eat smaller portions.",
                                              style: rule()),
                                          space(10),
                                          Text(
                                              "4.Be mindful of what you put in your mouth and your shopping trolley.",
                                              style: rule()),
                                          space(10),
                                          Text(
                                              "5.DO Daily Exercise recommended by Fit Core",
                                              style: rule()),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    space(20),
                                    Image.asset(
                                      "assets/underweight.png",
                                      height: 200,
                                    ),
                                    healthIndicator(
                                        "BMI : ${num.toStringAsFixed(2)}"),
                                    healthIndicator("You Are Under Weight"),
                                    space(10),
                                    QuickTips(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 30.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "1.Consume Heavy food items that contains more calories.",
                                            style: rule(),
                                          ),
                                          space(10),
                                          Text(
                                              "2.Frequent consumption of food items which are rich in nutrients, it could be snacks, shakes or juices, or proper meals.",
                                              style: rule()),
                                          space(10),
                                          Text(
                                              "3.Adding extra ingredients that are high in calories to regular diet, for example, including eggs and bananas in morning breakfast, etc., can help in increasing the weight.",
                                              style: rule()),
                                          space(10),
                                          Text(
                                              "4.However, the diet shouldn’t be started drastically and instead, should be implemented gradually so that the body is accustomed with it.",
                                              style: rule()),
                                          space(10),
                                          Text(
                                              "5.DO Daily Exercise recommended by Fit Core",
                                              style: rule()),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                    )
                  : const SizedBox(),
              space(40)
            ],
          ),
        ),
      ),
    );
  }

  SizedBox space(double hei) {
    return SizedBox(
      height: hei,
    );
  }

  Text QuickTips() {
    return const Text(
      "This are Quick Health Tips For You",
      style: TextStyle(
          color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Text healthIndicator(String indicate) {
    return Text(
      indicate,
      style: const TextStyle(
          color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  TextStyle rule() {
    return const TextStyle(
        fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold);
  }

  calculate(double heightt, double wight) {
    return wight / ((heightt / 100) * (heightt / 100));
  }
}
