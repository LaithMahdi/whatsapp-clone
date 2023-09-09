import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controllers/splash/splash_controller.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_image.dart';
import '../../../core/constant/app_size.dart';
import '../../../widgets/spacer/spacer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(AppImage.whatsApp, width: AppSize.screenWidth! / 4),
          const Spacer(),
          Column(
            children: [
              Text(
                "from",
                style: TextStyle(
                    color: AppColor.blueGrey, fontWeight: FontWeight.w500),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImage.meta,
                        width: 25, color: AppColor.third),
                    const HorizintalSpacer(0.3),
                    const Text("Meta",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColor.third))
                  ])
            ],
          ),
          const VerticalSpacer(3)
        ],
      ),
    );
  }
}
