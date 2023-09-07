import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_route.dart';
import 'package:whatsapp_clone/data/model/chat_model.dart';

abstract class ChatController extends GetxController {}

class ChatControllerImpl extends ChatController {
  late List<ChatModel> _chats;
  late ChatModel _sender;
  goToDetailScreen(ChatModel chatModel) => Get.toNamed(AppRoute.chatDetail,
      arguments: {"chat": chatModel, "sender": _sender});

  goContactScreen() => Get.toNamed(AppRoute.contact);
  List<ChatModel> get chats => _chats;
  ChatModel get sender => _sender;

  @override
  void onInit() {
    _chats = Get.arguments["chat"];
    _sender = Get.arguments["sender"];
    super.onInit();
  }
}
