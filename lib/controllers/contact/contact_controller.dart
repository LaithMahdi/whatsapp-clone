import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_route.dart';
import 'package:whatsapp_clone/data/data%20source/chat_list.dart';
import 'package:whatsapp_clone/data/model/chat_model.dart';

abstract class ContactController extends GetxController {}

class ContactControllerImpl extends ContactController {
  final List<String> _popMenuItems = [
    "Invite a friend",
    "Contacts",
    "Refrech",
    "Help",
  ];
  final List<ChatModel> groups = [];
  bool isSelect = false;
  final List<Map<String, dynamic>> _buttonsItems = [
    {"name": "New contact", "icon": Icons.person_add, "function": () {}},
    {
      "name": "New group",
      "icon": Icons.group,
      "function": () => Get.toNamed(AppRoute.group)
    },
  ];
  final List<ChatModel> _contacts =
      chatList.where((element) => !element.isGroup).toList();
  List<String> get popMenuItems => _popMenuItems;
  List<ChatModel> get contacts => _contacts;
  List<Map<String, dynamic>> get buttonsItems => _buttonsItems;

  // changeCheck(ChatModel chat) {
  //   if (chat.isSelect == false) {
  //     chat.isSelect = true;
  //     groups.add(chat);
  //   } else {
  //     chat.isSelect = false;
  //     groups.remove(chat);
  //   }
  //   update();
  // }
}
