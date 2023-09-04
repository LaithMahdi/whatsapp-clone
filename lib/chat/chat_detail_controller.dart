import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/data/model/chat_model.dart';

abstract class ChatDetailController extends GetxController {}

class ChatDetailControllerImpl extends ChatDetailController {
  late ChatModel chat;
  late bool isEmojiShow;
  late String popMenu;
  late FocusNode focusNode;
  late TextEditingController message;
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
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isEmojiShow = false;
        update();
      }
    });
    isEmojiShow = false;
    chat = Get.arguments["chat"];
    popMenu = popMenuItems.first;
    message = TextEditingController();
    super.onInit();
  }

  selectPopMenu(String? value) {
    popMenu = value!;
  }

  void showEmojiKeyborad() {
    focusNode.unfocus();
    focusNode.canRequestFocus = false;
    isEmojiShow = isEmojiShow ? false : true;
    update();
  }

  back() => Get.back();

  void onEmojiSelected(Category? category, Emoji? emoji) {
    message.text += emoji!.emoji;
    update();
  }

  Future<bool> onWillPop() {
    if (isEmojiShow) {
      isEmojiShow = false;
      update();
    } else {
      Get.back();
    }

    return Future.value(false);
  }
}
