import 'dart:convert';
import 'dart:math';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'colour.dart';

class VideoInfo extends StatefulWidget {
  final int input;
  const VideoInfo({Key? key, required this.input}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List info = [];
  bool _playArea = false;
  bool _isplaying = false;
  bool _dispose = false;
  String day = "";
  late String loader;
  late String name;
  late int _isplayingIndex;
  VideoPlayerController? _controller;
  _initData() async {
    if (widget.input == 1) {
      loader = "assets/glues.json";
      setState(() {
        name = "Glues";
        day = "Monday";
      });
    }
    if (widget.input == 2) {
      loader = "assets/abs.json";
      setState(() {
        name = "Abs";
        day = "Tuesday";
      });
    }
    if (widget.input == 3) {
      loader = "assets/glues.json";
      setState(() {
        name = "Legs";
        day = "Wednesday";
      });
    }
    if (widget.input == 4) {
      loader = "assets/arms.json";
      setState(() {
        name = "Arms";
        day = "Thursday";
      });
    }
    if (widget.input == 5) {
      loader = "assets/back.json";
      setState(() {
        name = "Back";
        day = "Friday";
      });
    }
    if (widget.input == 6) {
      loader = "assets/shoulder.json";
      setState(() {
        name = "Should";
        day = "Saturday";
      });
    }
    await DefaultAssetBundle.of(context).loadString(loader).then((value) {
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
  void dispose() {
    _dispose = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String nameme = name;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColor.gradientFirst.withOpacity(0.8),
          AppColor.gradientSecond
        ], begin: const FractionalOffset(0.0, 0.4), end: Alignment.topRight)),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding: EdgeInsets.only(
                      top: 70,
                      left: 30,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 320,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 20,
                                color: AppColor.secondPageIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor:
                                            AppColor.gradientSecond,
                                        duration: Duration(seconds: 2),
                                        content: Container(
                                          height: 43,
                                          child: Column(
                                            children: [
                                              Text(name,
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              Text(day,
                                                  style:
                                                      TextStyle(fontSize: 16))
                                            ],
                                          ),
                                        )));
                              },
                              child: Icon(
                                Icons.info_outline,
                                size: 20,
                                color: AppColor.secondPageIconColor,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          nameme,
                          // "",
                          style: TextStyle(
                            fontSize: 35,
                            color: AppColor.homePageContainerTextSmall,
                          ),
                        ),
                        Text(
                          "Workout",
                          style: TextStyle(
                            fontSize: 35,
                            color: AppColor.homePageContainerTextSmall,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white.withOpacity(0.15)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.alarm,
                                    size: 20,
                                    color: AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("60 min",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.secondPageIconColor))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 205,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white.withOpacity(0.15)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text("Resistent Band, Kettebell",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.secondPageIconColor))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 50, left: 30),
                          height: 100,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 20,
                                  color: AppColor.secondPageIconColor,
                                ),
                              ),
                              Expanded(child: Container()),
                              InkWell(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              AppColor.gradientSecond,
                                          duration: Duration(seconds: 2),
                                          content: Container(
                                            height: 43,
                                            child: Column(
                                              children: [
                                                Text(name,
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                                Text(day,
                                                    style:
                                                        TextStyle(fontSize: 16))
                                              ],
                                            ),
                                          )));
                                },
                                child: Icon(
                                  Icons.info_outline,
                                  size: 20,
                                  color: AppColor.secondPageIconColor,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              )
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlview(context),
                      ],
                    ),
                  ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                        // color: Colors.red,
                        color: AppColor.gradientFirst.withOpacity(0.6),
                        blurRadius: 30,
                        offset: Offset(-1, -10))
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Circuit ${widget.input}: ${nameme} Toning",
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColor.circuitsColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(
                            Icons.loop,
                            size: 30,
                            color: AppColor.loopColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "3 Sets",
                            style: TextStyle(
                                fontSize: 15, color: AppColor.setsColor),
                          ),
                          const SizedBox(
                            width: 33,
                          )
                        ],
                      ),
                    ],
                  ),
                  Expanded(child: _listView())
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  String convertTo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlview(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTo(remained ~/ 60.0);
    final secs = convertTo(remained % 60);
    return Column(
      children: [
        SizedBox(
          height: 18,
        ),
        SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTrackColor: AppColor.gradientFirst,
                inactiveTrackColor: AppColor.gradientSecond,
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 2,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Colors.blue,
                overlayColor: Colors.blueAccent,
                overlayShape: RoundSliderOverlayShape(overlayRadius: 18),
                activeTickMarkColor: Colors.blue[700],
                inactiveTickMarkColor: Colors.blue[700],
                valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.blueAccent,
                valueIndicatorTextStyle: TextStyle(color: Colors.white)),
            child: Slider(
              value: max(0, min(_progress * 100, 100)),
              min: 0,
              max: 100,
              divisions: 100,
              label: _position?.toString().split(".")[0],
              onChanged: (Value) {
                setState(() {
                  _progress = Value * 0.01;
                });
              },
              onChangeStart: (Value) {
                _controller?.pause();
              },
              onChangeEnd: (value) {
                final duration = _controller?.value.duration;
                if (duration != null) {
                  var newValue = max(0, min(value, 99)) * 0.01;
                  var millis = (duration.inMilliseconds * newValue).toInt();
                  _controller?.seekTo(Duration(milliseconds: millis));
                  _controller?.play();
                }
              },
            )),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              IconButton(
                  onPressed: () {
                    if (noMute) {
                      _controller?.setVolume(0);
                    } else {
                      _controller?.setVolume(1);
                    }
                    setState(() {});
                  },
                  icon: Icon(
                    noMute ? Icons.volume_up : Icons.volume_off,
                    size: 35,
                    color: Colors.white,
                  )),
              SizedBox(
                width: (MediaQuery.of(context).size.width) / 10,
              ),
              IconButton(
                  onPressed: () async {
                    final index = _isplayingIndex - 1;
                    if (index >= 0 && info.length >= 0) {
                      _onTapVideo(index);
                    } else {
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.warning,
                          text: "This is First video");
                    }
                  },
                  icon: Icon(
                    Icons.fast_rewind,
                    size: 35,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () async {
                    if (_isplaying) {
                      _controller?.pause();
                      setState(() {
                        _isplaying = false;
                      });
                    } else {
                      _controller?.play();
                      setState(() {
                        _isplaying = true;
                      });
                    }
                  },
                  icon: Icon(
                    _isplaying ? Icons.pause : Icons.play_arrow,
                    size: 35,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () async {
                    final index = _isplayingIndex + 1;
                    if (index < info.length) {
                      _onTapVideo(index);
                    } else {
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.warning,
                          text: "This is last video");
                    }
                  },
                  icon: Icon(
                    Icons.fast_forward,
                    size: 35,
                    color: Colors.white,
                  )),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 30),
                child: Text(
                  "$mins:$secs",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          )));
    }
  }

  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;
  void _onControllerUpdate() async {
    if (_dispose) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().microsecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      debugPrint("null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("not initialized");
      return;
    }
    if (_duration == null) {
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;

    final playing = controller.value.isPlaying;
    if (playing) {
      if (_dispose) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _isplaying = playing;
  }

  _onTapVideo(int i) {
    final controller = VideoPlayerController.network(info[i]['videoUrl']);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    // ignore: avoid_single_cascade_in_expression_statements
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isplayingIndex = i;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _listView() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: info.length,
        itemBuilder: (_, int i) {
          return GestureDetector(
              onTap: () {
                _onTapVideo(i);
                setState(() {
                  if (_playArea == false) {
                    _playArea = true;
                  }
                });
              },
              child: _buildView(i));
        });
  }

  _buildView(int i) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          info[i]['thumbnail'],
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(32),
                    child: Icon(
                      Icons.play_circle_fill,
                      size: 35,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info[i]['title'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    info[i]['time'],
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Container(
                height: 18,
                width: 80,
                decoration: BoxDecoration(
                    color: Color(0xffeaeefc),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "30s rest",
                    style: TextStyle(color: Color(0xff839fed)),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0;
                      i < (MediaQuery.of(context).size.width) / 6;
                      i++)
                    Container(
                        width: 4,
                        height: 3,
                        decoration: BoxDecoration(
                            color: i.isOdd ? Color(0xff839fed) : Colors.white,
                            borderRadius: BorderRadius.circular(2)))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
