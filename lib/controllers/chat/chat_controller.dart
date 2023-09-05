import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_route.dart';
import 'package:whatsapp_clone/data/model/chat_model.dart';

abstract class ChatController extends GetxController {}

class ChatControllerImpl extends ChatController {
  goToDetailScreen(ChatModel chatModel) =>
      Get.toNamed(AppRoute.chatDetail, arguments: {"chat": chatModel});

  goContactScreen() => Get.toNamed(AppRoute.contact);
}
