import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_route.dart';

import '../../main.dart';

abstract class CustomCameraController extends GetxController {}

class CameraControllerImpl extends CustomCameraController {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  late XFile _path;
  bool _isRecording = false;
  bool _isOpenFlash = false;
  bool _isFrontCamera = false;

  CameraController get cameraController => _cameraController;
  bool get isRecording => _isRecording;
  bool get isOpenFlash => _isOpenFlash;
  bool get isFrontCamera => _isFrontCamera;

  @override
  void onInit() {
    changePositionOfCamera();
    super.onInit();
  }

  @override
  void onClose() {
    _cameraController.dispose();
    super.onClose();
  }

  changePositionOfCamera() {
    _isFrontCamera = !_isFrontCamera;

    int isPosCamera = _isFrontCamera ? 0 : 1;

    _cameraController = CameraController(
        cameras[isPosCamera], ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.jpeg);

    cameraValue = _cameraController.initialize();

    update();
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
  }

  stopRecordingVideo() async {
    _isRecording = false;
    update();
    _path = await _cameraController.stopVideoRecording();
    Get.toNamed(AppRoute.videoView, arguments: {"path": _path});
  }

  openFlash() {
    _isOpenFlash = !_isOpenFlash;
    if (_isOpenFlash) {
      _cameraController.setFlashMode(FlashMode.torch);
    } else {
      _cameraController.setFlashMode(FlashMode.off);
    }
    update();
  }

  backToHome() => Get.back();
}
