import 'package:get/get.dart';

import '../../data/data source/chat_list.dart';
import '../../data/model/chat_model.dart';

abstract class GroupController extends GetxController {}

class GroupControlllerImpl extends GroupController {
  final List<String> _popMenuItems = [
    "Invite a friend",
    "Contacts",
    "Refrech",
    "Help",
  ];
  final List<ChatModel> groups = [];
  bool isSelect = false;

  final List<ChatModel> _contacts =
      chatList.where((element) => !element.isGroup).toList();
  List<String> get popMenuItems => _popMenuItems;
  List<ChatModel> get contacts => _contacts;

  changeCheck(ChatModel chat) {
    if (chat.isSelect == false) {
      chat.isSelect = true;
      groups.add(chat);
      update();
    } else {
      chat.isSelect = false;
      groups.remove(chat);
      update();
    }
  }
}
