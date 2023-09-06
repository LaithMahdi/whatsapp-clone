import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

abstract class PictureViewController extends GetxController {}

class PictureViewControllerImpl extends PictureViewController {
  late XFile _path;
  List<Map<String, dynamic>> headersItems = [
    {"icon": EvaIcons.close, "function": () => Get.back()},
    {"icon": Icons.hd, "function": () {}},
    {"icon": Icons.crop_rotate, "function": () {}},
    {"icon": Icons.emoji_emotions_outlined, "function": () {}},
    {"icon": Icons.title, "function": () {}},
    {"icon": EvaIcons.edit, "function": () {}},
  ];
  @override
  void onInit() {
    _path = Get.arguments["path"];
    super.onInit();
  }

  XFile get path => _path;
}
