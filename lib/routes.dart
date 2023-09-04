import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_route.dart';
import 'package:whatsapp_clone/view/screens/home_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
];
