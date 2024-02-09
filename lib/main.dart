import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pharma/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: mainpage(),
    );
  }
}

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  double progressvalue = 0.2;
  void initState() {
    progress();
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
                fullscreenDialog: true, builder: (context) => Next())));
  }

  void progress() {
    Timer(
      Duration(seconds: 2),
      () => progressvalue = 0.9,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeae5fe),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            Image.asset(
              "images/splash.png",
              width: 300,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              //Progressbar
              margin: EdgeInsets.symmetric(vertical: 20),
              width: 300,
              height: 7,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: progressvalue,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffa984fe)),
                  backgroundColor: Color(0xffD6D6D6),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
