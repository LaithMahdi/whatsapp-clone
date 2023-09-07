import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_size.dart';
import 'package:whatsapp_clone/widgets/spacer/spacer.dart';
import '../../../controllers/chat/chat_detail_controller.dart';
import '../../../core/constant/app_color.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDetailControllerImpl>(
        builder: (controller) => TextFormField(
              controller: controller.message,
              focusNode: controller.focusNode,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              onChanged: (value) => controller.changeMessageToVoice(value),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  hintText: "Type a message",
                  prefixIcon: IconButton(
                      onPressed: () => controller.showEmojiKeyborad(),
                      icon: const Icon(Icons.emoji_emotions)),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.bottomSheet(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              Container(
                                margin: const EdgeInsets.all(15),
                                width: AppSize.screenWidth,
                                height: AppSize.screenHeight! * .25,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Wrap(
                                  runAlignment: WrapAlignment.center,
                                  alignment: WrapAlignment.center,
                                  spacing: 60,
                                  runSpacing: 20,
                                  children: [
                                    ...List.generate(
                                      controller.bottomSheetItems.length,
                                      (index) => IconBottomSheet(
                                          text: controller
                                              .bottomSheetItems[index]["text"],
                                          icon: controller
                                              .bottomSheetItems[index]["icon"],
                                          backgroundColor: controller
                                              .bottomSheetItems[index]["color"],
                                          onTap:
                                              controller.bottomSheetItems[index]
                                                  ["function"]),
                                    ),
                                  ],
                                ),
                              ));
                        },
                        icon: const Icon(Icons.attach_file),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt),
                      )
                    ],
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25))),
            ));
  }
}

class IconBottomSheet extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onTap;
  const IconBottomSheet(
      {super.key,
      required this.text,
      required this.icon,
      required this.backgroundColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: backgroundColor,
            child: Icon(icon, size: 25, color: AppColor.white),
          ),
          const VerticalSpacer(0.5),
          Text(
            text,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
