import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_color.dart';
import 'package:whatsapp_clone/core/constant/app_size.dart';
import 'package:whatsapp_clone/view/widgets/chats/chat%20detail/components/custom_appbar.dart';
import 'package:whatsapp_clone/view/widgets/chats/message_input.dart';
import '../../../controllers/chat/chat_detail_controller.dart';
import '../../../widgets/emoji/custom_emoji.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.lazyPut(() => ChatDetailControllerImpl());
    ChatDetailControllerImpl controller = Get.put(ChatDetailControllerImpl());
    return Scaffold(
      backgroundColor: AppColor.blueGrey,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppSize.screenHeight! * .07),
          child: const CustomAppBar()),
      body: Container(
        width: AppSize.screenWidth,
        height: AppSize.screenHeight,
        color: Colors.transparent,
        child: WillPopScope(
          onWillPop: () => controller.onWillPop(),
          child: Column(
            children: [
              Expanded(child: ListView()),
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
                            child: const MessageInput()),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 3, right: 3, bottom: 10),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColor.second,
                            child: IconButton(
                                onPressed: () => controller.sendMessge(),
                                icon: const Icon(Icons.mic,
                                    color: AppColor.white)),
                          ),
                        ),
                      ],
                    ),
                    GetBuilder<ChatDetailControllerImpl>(
                      builder: (controller) => controller.isEmojiShow
                          ? CustomEmoji(
                              onEmojiSelected: (category, emoji) =>
                                  controller.onEmojiSelected(category, emoji),
                            )
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
