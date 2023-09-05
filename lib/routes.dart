import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_route.dart';
import 'package:whatsapp_clone/view/screens/chats/chat_detail_screen.dart';
import 'package:whatsapp_clone/view/screens/chats/chat_screen.dart';
import 'package:whatsapp_clone/view/screens/contact/contact_screen.dart';
import 'package:whatsapp_clone/view/screens/group/group_screen.dart';
import 'package:whatsapp_clone/view/screens/home_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.chat, page: () => const ChatScreen()),
  GetPage(name: AppRoute.chatDetail, page: () => const ChatDetailScreen()),
  GetPage(name: AppRoute.contact, page: () => const ContactScreen()),
  GetPage(name: AppRoute.group, page: () => const GroupScreen()),
];
