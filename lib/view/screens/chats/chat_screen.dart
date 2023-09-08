import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/chat/chat_controller.dart';
import '../../../data/data source/chat_list.dart';
import '../../widgets/chats/custom_chat_card.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChatControllerImpl controller = Get.put(ChatControllerImpl());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goContactScreen(),
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: controller.chats.length,
        itemBuilder: (context, index) => CustomChatCard(
          chatModel: controller.chats[index],
          onTap: () => controller.goToDetailScreen(chatList[index]),
        ),
      ),
    );
  }
}
