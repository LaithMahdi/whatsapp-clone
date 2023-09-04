import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_color.dart';
import 'package:whatsapp_clone/core/constant/app_size.dart';
import '../../chat/chat_detail_controller.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.lazyPut(() => ChatDetailControllerImpl());
    ChatDetailControllerImpl controller = Get.put(ChatDetailControllerImpl());
    return Scaffold(
      backgroundColor: AppColor.blueGrey,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          PopupMenuButton(
            itemBuilder: (context) => [
              ...List.generate(
                  controller.popMenuItems.length,
                  (index) => PopupMenuItem(
                        value: Text(controller.popMenuItems[index]),
                        child: Text(controller.popMenuItems[index]),
                      ))
            ],
          )
        ],
        leadingWidth: AppSize.screenWidth! / 6,
        leading: InkWell(
          onTap: () => controller.back(),
          child: Row(children: [
            const Icon(Icons.arrow_back, size: 24),
            CircleAvatar(
                backgroundColor: AppColor.blueGrey,
                child: Icon(
                    controller.chat.isGroup ? Icons.groups : Icons.person,
                    size: 30,
                    color: AppColor.white))
          ]),
        ),
        titleSpacing: 0,
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.chat.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Last seen today at 14:28",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: AppSize.screenWidth,
        height: AppSize.screenHeight,
        color: Colors.transparent,
        child: WillPopScope(
          onWillPop: () => controller.onWillPop(),
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 2, right: 2, bottom: 10),
                          width: AppSize.screenWidth! - 60,
                          child: GetBuilder<ChatDetailControllerImpl>(
                            builder: (controller) => TextFormField(
                              controller: controller.message,
                              focusNode: controller.focusNode,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColor.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  hintText: "Type a message",
                                  prefixIcon: IconButton(
                                      onPressed: () =>
                                          controller.showEmojiKeyborad(),
                                      icon: const Icon(Icons.emoji_emotions)),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
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
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 3, right: 3, bottom: 10),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColor.second,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.mic,
                                    color: AppColor.white)),
                          ),
                        ),
                      ],
                    ),
                    GetBuilder<ChatDetailControllerImpl>(
                      builder: (controller) => controller.isEmojiShow
                          ? const CustomEmoji()
                          : const SizedBox(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomEmoji extends GetView<ChatDetailControllerImpl> {
  const CustomEmoji({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.screenHeight! * .35,
      child: EmojiPicker(
        onEmojiSelected: (category, emoji) {
          controller.onEmojiSelected(category, emoji);
        },
      ),
    );
  }
}
