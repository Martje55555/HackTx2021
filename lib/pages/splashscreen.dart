import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hack_tx_2021/pages/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color(0xff4C748B),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/image/aloonsssx.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Space Traveling",
                  style: TextStyle(
                      fontFamily: "Norwester",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      color: Colors.black),
                ),
                Text("Crossing Dimensions",
                    style: TextStyle(
                      fontFamily: "Kollektif",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    ))
              ],
            ))));
  }
}
