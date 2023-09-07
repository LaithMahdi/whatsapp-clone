import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_route.dart';

import '../../data/data source/chat_list.dart';
import '../../data/model/chat_model.dart';

class LoginController extends GetxController {
  late ChatModel sender;
  goToHomeScreen(int index) {
    sender = chatList.removeAt(index);
    Get.offAllNamed(AppRoute.home, arguments: {
      "chat": chatList,
      "sender": sender,
    });
  }
}
