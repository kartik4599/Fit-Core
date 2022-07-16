import 'package:flutter/material.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_application_2/videoinfo.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const HomePage(),
      //   '/second': (context) => const VideoInfo(),
      // },
    );
  }
}
