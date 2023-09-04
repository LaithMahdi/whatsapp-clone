import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/chat/chat_controller.dart';
import 'package:whatsapp_clone/core/constant/app_color.dart';
import 'package:whatsapp_clone/data/data%20source/chat_list.dart';
import 'package:whatsapp_clone/data/model/chat_model.dart';
import 'package:whatsapp_clone/widgets/spacer/spacer.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChatControllerImpl controller = Get.put(ChatControllerImpl());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) => CustomChatCard(
          chatModel: chatList[index],
          onTap: () => controller.goToDetailScreen(chatList[index]),
        ),
      ),
    );
  }
}

class CustomChatCard extends StatelessWidget {
  final ChatModel chatModel;
  final VoidCallback onTap;
  const CustomChatCard(
      {super.key, required this.chatModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
          radius: 25,
          backgroundColor: AppColor.blueGrey,
          child: Icon(chatModel.isGroup ? Icons.groups : Icons.person,
              size: 30, color: AppColor.white)),
      title: Flexible(
        child: Text(
          chatModel.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Row(
        children: [
          const Icon(Icons.done_all, size: 16, color: AppColor.blueGrey),
          const HorizintalSpacer(0.4),
          Flexible(
            child: Text(chatModel.message,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: AppColor.blueGrey)),
          ),
        ],
      ),
      trailing: Text(
        chatModel.time,
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: AppColor.blueGrey),
      ),
    );
  }
}
