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
                  itemBuilder: (context, index) {
                    return MessageChat(
                        isSender: controller.messages[index].type == "sender"
                            ? true
                            : false,
                        message: controller.messages[index].message);
                  },
                  itemCount: controller.messages.length,
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

class MessageChat extends StatelessWidget {
  final String message;
  final bool isSender;
  const MessageChat({super.key, required this.isSender, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        constraints: BoxConstraints(maxWidth: AppSize.screenWidth! - 60),
        decoration: BoxDecoration(
          color: isSender ? AppColor.green10 : AppColor.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey, blurRadius: 1, offset: Offset(1, 0.5)),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 60, 20),
              child: Text(
                message,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              bottom: 6,
              right: 10,
              child: isSender
                  ? Row(
                      children: [
                        Text(
                          "20:58",
                          style:
                              TextStyle(fontSize: 13, color: AppColor.grey600),
                        ),
                        const HorizintalSpacer(0.5),
                        const Icon(Icons.done_all, size: 18)
                      ],
                    )
                  : Text(
                      "20:58",
                      style: TextStyle(fontSize: 13, color: AppColor.grey600),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
