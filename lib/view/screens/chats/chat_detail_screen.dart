import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_color.dart';
import 'package:whatsapp_clone/core/constant/app_image.dart';
import 'package:whatsapp_clone/core/constant/app_size.dart';
import 'package:whatsapp_clone/view/widgets/chats/chat%20detail/components/custom_appbar.dart';
import 'package:whatsapp_clone/view/widgets/chats/message_input.dart';
import 'package:whatsapp_clone/widgets/spacer/spacer.dart';
import '../../../controllers/chat/chat_detail_controller.dart';
import '../../../widgets/emoji/custom_emoji.dart';
import '../../widgets/chats/chat detail/components/message_chat.dart';

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
        decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage(AppImage.bg), fit: BoxFit.cover)),
        child: WillPopScope(
          onWillPop: () => controller.onWillPop(),
          child: Column(
            children: [
              Expanded(
                  child: GetBuilder<ChatDetailControllerImpl>(
                builder: (controller) => ListView.builder(
                  controller: controller.scrollController,
                  itemBuilder: (context, index) {
                    if (index == controller.messages.length) {
                      return const VerticalSpacer(7);
                    }
                    return MessageChat(
                      isSender: controller.messages[index].type == "sender"
                          ? true
                          : false,
                      message: controller.messages[index].message,
                      date: controller.messages[index].date,
                    );
                  },
                  itemCount: controller.messages.length + 1,
                ),
              )),
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
                                icon: GetBuilder<ChatDetailControllerImpl>(
                                  builder: (controller) => Icon(
                                      controller.isSend
                                          ? Icons.send
                                          : Icons.mic,
                                      color: AppColor.white),
                                )),
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
