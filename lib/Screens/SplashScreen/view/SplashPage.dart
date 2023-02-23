import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Get.offAllNamed('Home');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: Get.height/6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: Get.height/2,
                      width: Get.height/2,
                      child:  Lottie.asset("assets/animation/childrens_drawing.json"),
                    ),
                    Container(
                      height: Get.height/1.5,
                      width: Get.height/1.5,
                      child:  Lottie.asset("assets/animation/teach_drawing.json"),
                    ),
                  ],
                ),
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: Get.height/8),
                child:  Container(
                  height: Get.height/7,
                  width: Get.height/7,
                  child: Lottie.asset("assets/animation/loading.json"),
                )
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: Get.height/13),
                child: Text(
                  "From",
                  style: GoogleFonts.caveatBrush(
                      fontSize: 15.sp,
                      color: Colors.grey
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: Get.height/60),
                child: Text(
                  "Jayraj",
                  style: GoogleFonts.caveatBrush(
                      fontSize: 21.sp,
                      color: Colors.deepPurpleAccent
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
