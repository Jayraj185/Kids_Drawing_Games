import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_drawing_games/Screens/HomeScreen/Controller/HomeController.dart';
import 'package:kids_drawing_games/Screens/HomeScreen/Model/DrawingModel.dart';
import 'package:sizer/sizer.dart';

class ImageDrawPage extends StatefulWidget {
  const ImageDrawPage({Key? key}) : super(key: key);

  @override
  State<ImageDrawPage> createState() => _ImageDrawPageState();
}

class _ImageDrawPageState extends State<ImageDrawPage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Container(
                height: Get.height/9,
                width: Get.height/9,
               decoration: BoxDecoration(
                 color: Colors.pinkAccent,
                 borderRadius: BorderRadius.circular(12)
               ),
                margin: EdgeInsets.only(left: Get.width/60,top: Get.height/30),
                alignment: Alignment.center,
                child: Icon(Icons.home,color: Colors.white,size: 25.sp,),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: (){
                // print("========= ${homeController.ListLenth2.length}  ${homeController.AddDrawing.length}");
                // if(homeController.AddDrawing.length > 1)
                //   {
                //     //int i = homeController.ListLenth2.length;//3
                //
                //     for(int j=0; j<homeController.ListLenth2[0]; j++)//0<28
                //     {
                //       homeController.points.add(homeController.AddDrawing[j]);
                //       // homeController.AddDrawing.removeAt(j);
                //     }
                //     print(" I ============= ${homeController.ListLenth2[0]} ${homeController.AddDrawing.length}");
                //     homeController.AddDrawing.removeRange(0, homeController.ListLenth2[0]);
                //     homeController.ListLenth2.removeAt(0);
                //     print(" I ============= ${homeController.ListLenth2[0]} ${homeController.AddDrawing.length}");
                //     // homeController.AddDrawing.clear();
                //     // print("=========$i ${homeController.ListLenth.length}");
                //     // homeController.points.add(homeController.AddDrawing[0]);
                //   }

              },
              child: Container(
                height: Get.height/9,
                width: Get.height/9,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(12)
                ),
                margin: EdgeInsets.only(right: Get.width/4.6),
                alignment: Alignment.center,
                child: Image.asset("assets/images/share.png",height: 21.sp,width: 21.sp,color: Colors.white,),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: (){
                print("========= ${homeController.ListLenth.length}");
               if(homeController.ListLenth.length > 1)
                 {
                   int i = homeController.ListLenth.length;
                   for(int j=homeController.ListLenth[i-2]; j<homeController.ListLenth[i-1]; j++)//44<92
                     {
                       homeController.AddDrawing.add(homeController.points[j]);
                       //print(" I ============= $j ${homeController.AddDrawing.length}");
                     }
                   homeController.points.removeRange(homeController.ListLenth[i-2], homeController.ListLenth[i-1]);
                    homeController.ListLenth.removeLast();
                 }
               else if(homeController.ListLenth.length == 1)
                 {
                   int i = homeController.ListLenth.length;
                   for(int j=0; j<homeController.ListLenth[i-1]; j++)
                   {
                     homeController.AddDrawing.add(homeController.points[j]);
                     //print("E ============= $j ${homeController.AddDrawing.length}");
                   }
                   homeController.points.removeRange(0, homeController.ListLenth[i-1]);
                    homeController.ListLenth.removeLast();
                 }
              },
              child: Container(
                height: Get.height/9,
                width: Get.height/9,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(12)
                ),
                margin: EdgeInsets.only(right: Get.width/3.4),
                alignment: Alignment.center,
                child: Image.asset("assets/images/back.png",height: 21.sp,width: 21.sp,color: Colors.white,),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: GestureDetector(
              onTap: (){
                homeController.points.clear();
              },
              child: Container(
                height: Get.height/9,
                width: Get.height/9,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(12)
                ),
                margin: EdgeInsets.only(left: Get.width/60,top: Get.height/30),
                alignment: Alignment.center,
                child: Icon(Icons.refresh,color: Colors.white,size: 25.sp,),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Obx(
              () => GestureDetector(

                onPanStart: (details) {
                  homeController.OnPanStart(details, context);
                },

                onPanUpdate: (details) {
                  homeController.OnPanUpdate(details, context);
                },

                onPanEnd: (details) {
                  homeController.OnPanEnd();
                },

                child: Container(
                  height: Get.height/1.2,
                  width: Get.width/1.8,
                  // color: Colors.red,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: Get.width/6),
                  child: Stack(
                    children: [
                      Image.asset("${homeController.data['image']}"),
                      CustomPaint(
                        size: Size.infinite,
                        painter: Drawing(pointList: homeController.points.value),
                      )
                    ],
                  )
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: Get.height,
              width: Get.width/4.8,
              color: Colors.greenAccent.shade100,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: Get.height,
                      width: Get.width/10,
                      color: Colors.greenAccent.shade100,
                      alignment: Alignment.center,
                      child: Obx(
                        () => SizedBox(
                          height: Get.height,
                          width: Get.height,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: homeController.colorList[0]["${homeController.STypes[homeController.SelectTypesIndex.value]}"].length,
                            itemBuilder: (context, index) {
                              return Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: (){
                                    if(homeController.SelectTypesIndex.value == 0)
                                      {
                                        homeController.SelectIndex.value = index;
                                        homeController.selectColor.value = homeController.colorList[0]['color'][index];
                                      }
                                    else if(homeController.SelectTypesIndex.value == 1)
                                      {
                                        homeController.SelectIndex2.value = index;
                                        homeController.SelectStoke.value = homeController.colorList[0]['stoke'][index];
                                        print("Stoke ======== ${homeController.SelectStoke.value}");
                                      }
                                    else if(homeController.SelectTypesIndex.value == 2)
                                    {
                                      print("========== In $index");
                                      homeController.SelectIndex3.value = index;
                                      homeController.SelectCap.value = homeController.colorList[0]['type'][index]['cap'];
                                    }
                                    print("========= ${homeController.SelectIndex.value}");
                                  },
                                  child: Obx(
                                    () => Container(
                                      height: homeController.SelectTypesIndex.value == 0 ? homeController.SelectIndex.value == index ? Get.height/5.5 : Get.height/7 : homeController.SelectTypesIndex.value == 1 ? homeController.SelectIndex2.value == index ? Get.height/5.5 : Get.height/7 : homeController.SelectTypesIndex.value == 2 ? homeController.SelectIndex3.value == index ? Get.height/5.5 : Get.height/7 : 0,
                                      width: homeController.SelectTypesIndex.value == 0 ? homeController.SelectIndex.value == index ? Get.height/5.5 : Get.height/7 : homeController.SelectTypesIndex.value == 1 ? homeController.SelectIndex2.value == index ? Get.height/5.5 : Get.height/7 : homeController.SelectTypesIndex.value == 2 ? homeController.SelectIndex3.value == index ? Get.height/5.5 : Get.height/7 : 0,
                                      // width: homeController.SelectIndex.value == index ? Get.height/5.5 : Get.height/7,
                                      margin: EdgeInsets.only(bottom: Get.height/30),
                                      decoration: BoxDecoration(
                                          color: homeController.SelectTypesIndex.value == 0 ? homeController.colorList[0]['color'][index] : Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(0,0),
                                                blurRadius: 15
                                            )
                                          ]
                                      ),
                                       alignment: Alignment.center,
                                      child: homeController.SelectTypesIndex.value == 0
                                          ? Text("")
                                          : Text(
                                        "${homeController.SelectTypesIndex.value == 1 ? homeController.colorList[0]['stoke'][index].round() : homeController.colorList[0]['type'][index]['name']}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: homeController.SelectTypesIndex.value == 2 ? homeController.SelectIndex3.value == index ? 15.sp : 9.sp : homeController.SelectIndex2.value == index ? 23.sp : 15.sp,
                                          fontWeight: homeController.SelectTypesIndex.value == 2 ? homeController.SelectIndex3.value == index ? FontWeight.w900 : FontWeight.w400 : homeController.SelectIndex2.value == index ? FontWeight.w900 : FontWeight.w400
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: Get.height,
                      width: Get.width/9,
                      color: Colors.greenAccent,
                      alignment: Alignment.center,
                      child: ListView.builder(
                          itemCount: homeController.Types.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:  EdgeInsets.only(top: Get.height/30),
                                child: InkWell(
                                  onTap: () {
                                    homeController.SelectTypesIndex.value = index;
                                    print("========= ${homeController.SelectTypesIndex.value}");
                                  },
                                  child: Obx(
                                    () => Text(
                                      "${homeController.Types[index]}",
                                      style: GoogleFonts.caveatBrush(
                                          color: homeController.SelectTypesIndex.value == index ? Colors.black : Colors.white,
                                          fontWeight: homeController.SelectTypesIndex.value == index ? FontWeight.bold : FontWeight.normal,
                                          fontSize: homeController.SelectTypesIndex.value == index ? 26.sp : 21.sp
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                      )
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
class Drawing extends CustomPainter
{
  Drawing({this.pointList});
    List<DrawingModel?>? pointList;
    List<Offset> offsetpoints = [];
  @override
  void paint(Canvas canvas, Size size) {

    for(int i=0; i<pointList!.length - 1; i++)
      {
        if(pointList![i]!.points != null && pointList![i + 1]!.points != null)
          {
            canvas.drawLine(pointList![i]!.points!, pointList![i + 1]!.points!, pointList![i]!.paint!);
          }
        else if(pointList![i]!.points != null && pointList![i + 1]!.points == null)
          {
            offsetpoints.clear();
            offsetpoints.add(pointList![i]!.points!);
            offsetpoints.add(Offset(pointList![i]!.points!.dx + 0.1, pointList![i]!.points!.dy + 0.1));
            canvas.drawPoints(PointMode.points , offsetpoints, pointList![i]!.paint!);
          }
      }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
