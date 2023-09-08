import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../data/model/chat_model.dart';
import '../../../widgets/spacer/spacer.dart';

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
          backgroundColor: AppColor.blueGrey200,
          child: Icon(chatModel.isGroup ? Icons.groups : Icons.person,
              size: 30, color: AppColor.white)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              chatModel.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            chatModel.time,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: AppColor.blueGrey200),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Icon(Icons.done_all, size: 16, color: AppColor.blueGrey200),
          const HorizintalSpacer(0.4),
          Flexible(
            child: Text(chatModel.message,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: AppColor.blueGrey)),
          ),
        ],
      ),
    );
  }
}
