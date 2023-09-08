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
    {
      "name": "New group",
      "icon": Icons.group,
      "function": () => Get.toNamed(AppRoute.group)
    },
    {"name": "New contact", "icon": Icons.person_add, "function": () {}},
    {"name": "New community", "icon": Icons.groups, "function": () {}},
  ];
  final List<ChatModel> _contacts =
      chatList.where((element) => !element.isGroup).toList();
  List<String> get popMenuItems => _popMenuItems;
  List<ChatModel> get contacts => _contacts;
  List<Map<String, dynamic>> get buttonsItems => _buttonsItems;
}
