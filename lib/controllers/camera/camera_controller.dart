import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_route.dart';

import '../../main.dart';

abstract class CustomCameraController extends GetxController {}

class CameraControllerImpl extends CustomCameraController {
  late CameraController _cameraController;
  late Future<void> cameraVaue;
  late XFile _path;
  bool _isRecording = false;

  CameraController get cameraController => _cameraController;
  bool get isRecording => _isRecording;
  @override
  void onInit() {
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraVaue = _cameraController.initialize();
    super.onInit();
  }

  @override
  void onClose() {
    _cameraController.dispose();
    super.onClose();
  }

  takePhotoWithCamera() async {
    if (!_isRecording) {
      _path = await _cameraController.takePicture();
      Get.toNamed(AppRoute.cameraView, arguments: {"path": _path});
    }
  }

  takeVideoWithCamera() async {
    _isRecording = true;
    update();
    await _cameraController.startVideoRecording();

    //
  }

  stopRecordingVideo() async {
    _isRecording = false;
    update();
    _path = await _cameraController.stopVideoRecording();
    Get.toNamed(AppRoute.videoView, arguments: {"path": _path});
  }
}
