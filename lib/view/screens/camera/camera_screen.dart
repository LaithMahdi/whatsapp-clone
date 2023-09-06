import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_color.dart';
import 'package:whatsapp_clone/core/constant/app_size.dart';

import '../../../controllers/camera/camera_controller.dart';

class CameraScren extends StatelessWidget {
  const CameraScren({super.key});

  @override
  Widget build(BuildContext context) {
    CameraControllerImpl controller = Get.put(CameraControllerImpl());
    return Scaffold(
      body: SizedBox(
        width: AppSize.screenWidth,
        height: AppSize.screenHeight,
        child: Stack(
          children: [
            FutureBuilder(
              future: controller.cameraVaue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(controller.cameraController);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                color: AppColor.black,
                width: AppSize.screenWidth,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                        GestureDetector(
                            onTap: () => controller.takePhotoWithCamera(),
                            onLongPress: () => controller.takeVideoWithCamera(),
                            onLongPressUp: () =>
                                controller.stopRecordingVideo(),
                            child: GetBuilder<CameraControllerImpl>(
                              builder: (controller) => controller.isRecording
                                  ? const Icon(
                                      Icons.radio_button_on,
                                      color: Colors.red,
                                      size: 70,
                                    )
                                  : const Icon(Icons.panorama_fish_eye,
                                      color: AppColor.white, size: 70),
                            )),
                        GetBuilder<CameraControllerImpl>(
                            builder: (controller) => IconButton(
                                onPressed: () =>
                                    controller.changePositionOfCamera(),
                                icon: Transform.rotate(
                                  angle: controller.isFrontCamera ? 0 : pi,
                                  child: const Icon(Icons.flip_camera_ios,
                                      color: AppColor.white, size: 28),
                                ))),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Text(
                        "Hold for Video, tap for photo",
                        style: TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // const VerticalSpacer(0.5)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
