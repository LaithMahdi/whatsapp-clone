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
