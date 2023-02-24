import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_drawing_games/Screens/HomeScreen/Controller/HomeController.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            child: Image.asset("assets/images/home_background.jpg",fit: BoxFit.fill,),
          ),
          Container(
            height: Get.height/1.5,
            width: Get.width,
            child: Row(
              children: [
                Container(
                  height: Get.height/1.5,
                  width: Get.width/4.6,
                  // color: Colors.red,
                  alignment: Alignment.bottomLeft,
                  child: Lottie.asset("assets/animation/parrot.json"),
                ),
                Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            homeController.data.value = homeController.Levels[index];
                            homeController.points.clear();
                            Get.toNamed('Draw');
                          },
                          child: Container(
                            height: Get.height/2.1,
                            width: Get.width/6,
                            decoration: BoxDecoration(
                              color: homeController.Levels[index]['color'],
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1.5,
                                  color: Colors.purple.shade900,
                                  offset: const Offset(6,5)
                                )
                              ]
                            ),
                            margin: EdgeInsets.only(left: Get.width/40,bottom: Get.height/50),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: Get.height/2.1,
                                      width: Get.width/6,
                                      alignment: Alignment.topCenter,
                                      child: Lottie.asset("${homeController.Levels[index]['animation']}"),
                                    )
                                ),
                                homeController.Levels[index]['animation2'] != null
                                ? Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      height: Get.height/2.1,
                                      width: Get.width/6,
                                       // color: Colors.black,
                                      alignment: Alignment.topCenter,
                                      // margin: EdgeInsets.only(left: Get.width/15),
                                      padding: EdgeInsets.only(left: Get.width/18,top: Get.height/21),
                                      child: Lottie.asset("${homeController.Levels[index]['animation2']}"),
                                    )
                                )
                                : Text(""),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: Get.height/60),
                                    child: Text(
                                      "${homeController.Levels[index]['title']}",
                                      style: GoogleFonts.caveatBrush(
                                        fontSize: 25.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(color: Colors.purple.shade900,blurRadius: 3,offset: Offset(0,3))
                                        ]
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
