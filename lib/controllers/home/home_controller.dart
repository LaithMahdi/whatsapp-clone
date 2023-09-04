import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/view/calls/call_screen.dart';
import 'package:whatsapp_clone/view/camera/camera_screen.dart';
import 'package:whatsapp_clone/view/chats/chat_screen.dart';
import 'package:whatsapp_clone/view/status/status_screen.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImpl extends HomeController
    with GetSingleTickerProviderStateMixin {
  late TabController _tabController;
  late String popUpMenu;
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

  selectPopMenu(String? value) {
    popUpMenu = value!;
  }
}
