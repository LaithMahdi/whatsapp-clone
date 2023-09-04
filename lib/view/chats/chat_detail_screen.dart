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
          onTap: () {},
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
      body: Text(controller.chat.name),
    );
  }
}
