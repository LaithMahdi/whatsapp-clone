import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_route.dart';

import '../../main.dart';

abstract class CustomCameraController extends GetxController {}

class CameraControllerImpl extends CustomCameraController {
  late CameraController _cameraController;
  late Future<void> cameraVaue;
  late XFile _path;

  CameraController get cameraController => _cameraController;
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
    _path = await _cameraController.takePicture();
    Get.toNamed(AppRoute.cameraView, arguments: {"path": _path});
  }
}
