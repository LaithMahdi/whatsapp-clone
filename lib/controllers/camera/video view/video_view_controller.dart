import 'dart:io';

import 'package:camera/camera.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

abstract class VideoViewController extends GetxController {}

class VideoViewControllerImpl extends VideoViewController {
  late XFile _path;
  late bool _video;

  late VideoPlayerController _playerController;
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
    _playerController = VideoPlayerController.file(File(_path.path))
      ..initialize().then((value) {});
    super.onInit();
  }

  XFile get path => _path;
  VideoPlayerController get playerController => _playerController;

  playVideo() {
    if (_playerController.value.isPlaying) {
      _playerController.pause();
    } else {
      _playerController.play();
    }
    update();
  }
}
