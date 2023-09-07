import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/data/model/chat_model.dart';
import 'package:whatsapp_clone/view/screens/calls/call_screen.dart';
import 'package:whatsapp_clone/view/screens/camera/camera_screen.dart';
import 'package:whatsapp_clone/view/screens/chats/chat_screen.dart';
import 'package:whatsapp_clone/view/screens/status/status_screen.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImpl extends HomeController
    with GetSingleTickerProviderStateMixin {
  late TabController _tabController;
  late String popUpMenu;
  late List<ChatModel> _chats;
  late ChatModel _sender;
  List<dynamic> tabs = [Icons.camera_alt, "chats", "status", "calls"];
  List<Widget> tabBarViews = const [
    CameraScren(),
    ChatScreen(),
    StatusScreen(),
    CallScreen(),
  ];
  List<String> popMenuItems = [
    "New group",
    "New boradcast",
    "Whatsapp Web",
    "Stared messages",
    "Settings",
  ];
  @override
  void onInit() {
    _chats = Get.arguments["chat"];
    _sender = Get.arguments["sender"];
    popUpMenu = popMenuItems.first;
    _tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 1);
    super.onInit();
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }

  // Getter
  get tabController => _tabController;
  List<ChatModel> get chats => _chats;
  ChatModel get sender => _sender;

  selectPopMenu(String? value) {
    popUpMenu = value!;
  }
}
