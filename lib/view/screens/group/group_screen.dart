import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controllers/group/group_controller.dart';
import 'package:whatsapp_clone/core/constant/app_color.dart';
import 'package:whatsapp_clone/core/constant/app_size.dart';
import 'package:whatsapp_clone/widgets/spacer/spacer.dart';

import '../../../data/model/chat_model.dart';
import '../../widgets/contact/components/custom_contact_item.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GroupControlllerImpl controller = Get.put(GroupControlllerImpl());
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        scrolledUnderElevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New group",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            Text("Add participants",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal)),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.search, size: 26)),
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
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: controller.contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return GetBuilder<GroupControlllerImpl>(
                    builder: (controller) =>
                        VerticalSpacer(controller.groups.isEmpty ? 1 : 9));
              } else {
                ChatModel chat = controller.contacts[index - 1];
                return GetBuilder<GroupControlllerImpl>(
                  builder: (controller) => CustomContactItem(
                    name: chat.name,
                    secondeName: chat.status,
                    isSelect: chat.isSelect,
                    onTap: () {
                      controller.changeCheck(chat);
                    },
                  ),
                );
              }
            },
          ),
          GetBuilder<GroupControlllerImpl>(
              builder: (controller) => controller.groups.isEmpty
                  ? const SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border(
                            bottom: BorderSide(color: AppColor.blueGrey200)),
                      ),
                      width: AppSize.screenWidth,
                      height: AppSize.screenHeight! * .1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.groups.length,
                        itemBuilder: (context, index) {
                          ChatModel chat = controller.groups[index];
                          return AvatarCard(
                            chat: chat,
                            onTap: () => controller.changeCheck(chat),
                          );
                        },
                      ),
                    ))
        ],
      ),
    );
  }
}

class AvatarCard extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onTap;
  const AvatarCard({super.key, required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundColor: AppColor.blueGrey200,
                  child:
                      const Icon(Icons.person, color: AppColor.white, size: 28),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: AppColor.blueGrey,
                      radius: 11,
                      child: const Icon(
                        Icons.clear,
                        size: 13,
                        color: AppColor.white,
                      ),
                    )),
              ],
            ),
            const VerticalSpacer(0.2),
            Text(
              chat.name,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
