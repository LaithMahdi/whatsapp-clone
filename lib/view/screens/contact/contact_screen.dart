import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controllers/contact/contact_controller.dart';
import 'package:whatsapp_clone/data/model/chat_model.dart';

import '../../widgets/contact/components/custom_contact_item.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactControllerImpl controller = Get.put(ContactControllerImpl());
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Contact",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            Text("${controller.contacts.length} contacts",
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.normal)),
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
      body: ListView(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.buttonsItems.length,
              itemBuilder: (context, index) {
                return CustomContactItem(
                  name: controller.buttonsItems[index]["name"],
                  isSecond: true,
                  icon: controller.buttonsItems[index]["icon"],
                  onTap: controller.buttonsItems[index]["function"],
                  isSelect: false,
                );
              }),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.contacts.length,
              itemBuilder: (context, index) {
                ChatModel chat = controller.contacts[index];
                return CustomContactItem(
                  name: chat.name,
                  secondeName: chat.status,
                  isSelect: chat.isSelect,
                );
              })
        ],
      ),
    );
  }
}
