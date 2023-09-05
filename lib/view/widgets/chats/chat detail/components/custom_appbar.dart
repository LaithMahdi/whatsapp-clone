import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/chat/chat_detail_controller.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_size.dart';

class CustomAppBar extends GetView<ChatDetailControllerImpl> {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              child: Icon(controller.chat.isGroup ? Icons.groups : Icons.person,
                  size: 30, color: AppColor.white))
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
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Last seen today at 14:28",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
