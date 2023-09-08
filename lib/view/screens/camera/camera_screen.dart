import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/camera/camera_controller.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';
import '../../widgets/camera/components/camera_button.dart';

class CameraScren extends StatelessWidget {
  const CameraScren({super.key});

  @override
  Widget build(BuildContext context) {
    CameraControllerImpl controller = Get.put(CameraControllerImpl());
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: AppSize.screenWidth,
          height: AppSize.screenHeight,
          child: Stack(
            children: [
              GetBuilder<CameraControllerImpl>(
                builder: (controller) => FutureBuilder(
                  future: controller.cameraValue,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SizedBox(
                          height: AppSize.screenHeight,
                          child: CameraPreview(controller.cameraController));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Positioned(
                  top: 15,
                  right: 15,
                  left: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => controller.backToHome(),
                          child: const Icon(Icons.close,
                              size: 28, color: AppColor.white)),
                      GetBuilder<CameraControllerImpl>(
                        builder: (controller) => IconButton(
                            onPressed: () => controller.openFlash(),
                            icon: Icon(
                                controller.isOpenFlash
                                    ? Icons.flash_on
                                    : Icons.flash_off,
                                color: AppColor.white,
                                size: 28)),
                      ),
                    ],
                  )),
              Positioned(
                right: 15,
                left: 15,
                bottom: AppSize.screenHeight! * 0.02,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: AppSize.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CameraButton(
                        icon: Icons.photo_album_rounded,
                        onTap: () {},
                      ),
                      GestureDetector(
                          onTap: () => controller.takePhotoWithCamera(),
                          onLongPress: () => controller.takeVideoWithCamera(),
                          onLongPressUp: () => controller.stopRecordingVideo(),
                          child: GetBuilder<CameraControllerImpl>(
                            builder: (controller) => controller.isRecording
                                ? const Icon(
                                    Icons.radio_button_on,
                                    color: Colors.red,
                                    size: 80,
                                  )
                                : const Icon(Icons.panorama_fish_eye,
                                    color: AppColor.white, size: 80),
                          )),
                      GetBuilder<CameraControllerImpl>(
                        builder: (controller) => CameraButton(
                          icon: Icons.flip_camera_android,
                          onTap: () => controller.changePositionOfCamera(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
