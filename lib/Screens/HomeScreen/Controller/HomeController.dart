import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_drawing_games/Screens/HomeScreen/Model/DrawingModel.dart';

class HomeController extends GetxController {

  //Only Variable's
  RxList Levels = [
    {
      'title': "Lion",
      'color': Colors.amberAccent,
      'animation': "assets/animation/lion.json",
      'animation2': null,
      'image' : "assets/images/lion_draw.png",
    },
    {
      'title': "House",
      'color': Colors.pink.shade300,
      'animation': "assets/animation/houses.json",
      'animation2': null,
      'image' : "assets/images/house_draw.png",
    },
    {
      'title': "Christmas",
      'color': Colors.deepPurpleAccent,
      'animation': "assets/animation/christmas_tree.json",
      'animation2': null,
      'image' : "assets/images/christmas_tree_draw.png",
    },
    {
      'title': "J",
      'color': Colors.lightBlueAccent,
      'animation': "assets/animation/j.json",
      'animation2': null,
      'image' : "assets/images/j_draw.png",
    },
    {
      'title': "18",
      'color': Colors.redAccent,
      'animation': "assets/animation/1.json",
      'animation2': "assets/animation/8.json",
      'image' : "assets/images/18_draw.png",
    },
    {
      'title': "Horse",
      'color': Colors.tealAccent,
      'animation': "assets/animation/horse.json",
      'animation2': null,
      'image' : "assets/images/horse_draw.png",
    },
  ].obs;
  Rx<Color> selectColor = Colors.red.obs;
  RxDouble SelectStoke = 1.0.obs;
  Rx<StrokeCap> SelectCap = StrokeCap.square.obs;
  RxMap data = {}.obs;
  RxInt SelectIndex = 0.obs;
  RxInt SelectIndex2 = 0.obs;
  RxInt SelectIndex3 = 0.obs;
  RxInt SelectTypesIndex = 0.obs;
  RxList ListLenth = [].obs;
  // RxList ListLenth2 = [].obs;
  RxList<DrawingModel?> AddDrawing = <DrawingModel>[].obs;
  RxList<DrawingModel?> points = <DrawingModel>[].obs;


  //Only Function's
  RxList Types = [
    'Colors',
    'Stoke',
    'Types',
  ].obs;
  RxList STypes = [
    'color',
    'stoke',
    'type',
  ].obs;
  RxList<Map> colorList = <Map>[
    {
      'color' : [
        Colors.red,
        Colors.yellow,
        Colors.pink,
        Colors.deepOrange,
        Colors.purple,
        Colors.green,
        Colors.blue,
        Colors.brown,
      ],
      'stoke' : [
        1.0,
        3.0,
        6.0,
        9.0,
        12.0,
        15.0,
        18.0,
        21.0,
        24.0,
        27.0,
        30.0,
        40.0,
        50.0,
      ],
      'type' : [
        {'cap' : StrokeCap.square, 'name' : "Square"},
        {'cap' : StrokeCap.round, 'name' : "Round"},
        {'cap' : StrokeCap.butt, 'name' : "Butt"},
      ],
    }
  ].obs;

  void OnPanStart(DragStartDetails details,BuildContext context)
  {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    points.add(DrawingModel(
        points: renderBox!.globalToLocal(details.globalPosition),
        paint: Paint()
          ..strokeCap = SelectCap.value
          ..isAntiAlias = true
          ..color = selectColor.value
          ..strokeWidth = SelectStoke.value
      ));
    update();
  }

  void OnPanUpdate(DragUpdateDetails details,BuildContext context)
  {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    points.add(DrawingModel(
        points: renderBox!.globalToLocal(details.globalPosition),
        paint: Paint()
          ..strokeCap = SelectCap.value
          ..isAntiAlias = true
          ..color = selectColor.value
          ..strokeWidth = SelectStoke.value
    ));
    update();
  }

  void OnPanEnd()
  {
    ListLenth.add(points.length);
    // ListLenth2.add(points.length);
    // print("============= LENTH ${ListLenth.length}  ${ListLenth2.length}\n=========== Value $ListLenth $ListLenth2");
    points.add(DrawingModel(points: null,paint: null));
    update();
  }

}
