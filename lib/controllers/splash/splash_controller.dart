import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_route.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
        const Duration(seconds: 2), () => Get.toNamed(AppRoute.login));
    super.onInit();
  }
}
