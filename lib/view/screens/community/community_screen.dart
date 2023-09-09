import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/constant/app_color.dart';
import 'package:whatsapp_clone/core/constant/app_image.dart';
import 'package:whatsapp_clone/core/constant/app_size.dart';
import 'package:whatsapp_clone/widgets/spacer/spacer.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VerticalSpacer(4),
          Image.asset(AppImage.image),
          const VerticalSpacer(1),
          const Text(
            "Stay connected with a community",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const VerticalSpacer(1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
                "Communities bring membres toghter in topic-based groups, and make it easy to get admin announcements. Any community you're added to will appear here.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blueGrey)),
          ),
          const VerticalSpacer(4.5),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.second,
                foregroundColor: AppColor.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                minimumSize: Size(AppSize.screenWidth! - 50, 0)),
            child: const Text(
              "Start your community",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
