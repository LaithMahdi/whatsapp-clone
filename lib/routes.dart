import 'package:get/get.dart';
import 'core/constant/app_route.dart';
import 'view/screens/auth/login_screen.dart';
import 'view/screens/camera/camera_screen.dart';
import 'view/screens/camera/picture view/picture_view_screen.dart';
import 'view/screens/camera/video view/video_view_screen.dart';
import 'view/screens/chats/chat_detail_screen.dart';
import 'view/screens/chats/chat_screen.dart';
import 'view/screens/contact/contact_screen.dart';
import 'view/screens/group/group_screen.dart';
import 'view/screens/home_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.login, page: () => const LoginScreen()),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.chat, page: () => const ChatScreen()),
  GetPage(name: AppRoute.chatDetail, page: () => const ChatDetailScreen()),
  GetPage(name: AppRoute.contact, page: () => const ContactScreen()),
  GetPage(name: AppRoute.group, page: () => const GroupScreen()),
  GetPage(name: AppRoute.camera, page: () => const CameraScren()),
  GetPage(name: AppRoute.cameraView, page: () => const PictureViewScreen()),
  GetPage(name: AppRoute.videoView, page: () => const VideoViewScreen()),
];
