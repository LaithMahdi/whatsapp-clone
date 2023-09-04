import 'package:get/get.dart';
import 'package:whatsapp_clone/data/model/chat_model.dart';

abstract class ChatDetailController extends GetxController {}

class ChatDetailControllerImpl extends ChatDetailController {
  late ChatModel chat;
  late String popMenu;
  List<String> popMenuItems = [
    "View contact",
    "Media, links, and docs",
    "Mute notifications",
    "Disappearing messages",
    "Wallpaper",
    "More"
  ];
  @override
  void onInit() {
    chat = Get.arguments["chat"];
    popMenu = popMenuItems.first;
    super.onInit();
  }

  selectPopMenu(String? value) {
    popMenu = value!;
  }
}
