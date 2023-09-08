import 'dart:io';

import 'package:camera/camera.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

abstract class VideoViewController extends GetxController {}

class VideoViewControllerImpl extends VideoViewController {
  late XFile _path;
  bool _isCompleted = false;
  late VideoPlayerController _playerController;

  List<Map<String, dynamic>> headersItems = [
    {"icon": EvaIcons.close, "function": () => Get.back()},
    {"icon": Icons.emoji_emotions_outlined, "function": () {}},
    {"icon": Icons.title, "function": () {}},
    {"icon": EvaIcons.edit, "function": () {}},
  ];
  @override
  void onInit() {
    _path = Get.arguments["path"];
    _playerController = VideoPlayerController.file(File(_path.path))
      ..initialize().then((_) {
        _playerController.addListener(() {
          if (_playerController.value.position >=
              _playerController.value.duration) {
            _isCompleted = true;
            update();
          }
        });
        update();
      });
    super.onInit();
  }

  XFile get path => _path;
  VideoPlayerController get playerController => _playerController;
  bool get isCompleted => _isCompleted;

  playVideo() {
    if (_playerController.value.isPlaying) {
      _playerController.pause();
    } else {
      _playerController.play();
    }
    update();
  }

  @override
  void onClose() {
    _playerController.dispose();
    super.onClose();
  }
}
