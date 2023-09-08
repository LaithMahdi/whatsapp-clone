import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone/controllers/camera/video%20view/video_view_controller.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size.dart';
import '../../../widgets/camera/components/caption_input.dart';
import '../../../widgets/camera/components/headerButton.dart';

class VideoViewScreen extends StatelessWidget {
  const VideoViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VideoViewControllerImpl controller = Get.put(VideoViewControllerImpl());
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: AppSize.screenHeight,
          width: AppSize.screenWidth,
          color: Colors.transparent,
          child: Stack(
            children: [
              SizedBox(
                height: AppSize.screenHeight! - 20,
                width: AppSize.screenWidth,
                child: GetBuilder<VideoViewControllerImpl>(
                  builder: (controller) =>
                      controller.playerController.value.isInitialized
                          ? AspectRatio(
                              aspectRatio:
                                  controller.playerController.value.aspectRatio,
                              child: VideoPlayer(controller.playerController))
                          : Container(),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: GetBuilder<VideoViewControllerImpl>(
                    builder: (controller) => HeaderButton(
                      icon: controller.playerController.value.isLooping ||
                              !controller.isCompleted
                          ? Icons.pause
                          : Icons.play_arrow,
                      isVideo: true,
                      onPressed: () => controller.playVideo(),
                    ),
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  color: AppColor.black,
                  width: AppSize.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Expanded(flex: 6, child: CaptionInput()),
                      Expanded(
                          child: HeaderButton(
                              icon: Icons.check,
                              color: AppColor.second,
                              onPressed: () {}))
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  left: 10,
                  child: Row(
                    children: [
                      HeaderButton(
                          icon: controller.headersItems[0]["icon"],
                          onPressed: controller.headersItems[0]["function"]),
                      const Spacer(),
                      ...List.generate(controller.headersItems.length - 1,
                          (index) {
                        return HeaderButton(
                            icon: controller.headersItems[index + 1]["icon"],
                            onPressed: controller.headersItems[index + 1]
                                ["function"]);
                      })
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
