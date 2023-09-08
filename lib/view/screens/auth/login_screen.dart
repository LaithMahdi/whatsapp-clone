import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controllers/auth/login_controller.dart';
import 'package:whatsapp_clone/core/constant/app_color.dart';
import 'package:whatsapp_clone/data/data%20source/chat_list.dart';
import 'package:whatsapp_clone/widgets/spacer/spacer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: ListView.separated(
          padding: const EdgeInsets.only(top: 30),
          itemCount: chatList.length - 15,
          separatorBuilder: (context, index) => const VerticalSpacer(1),
          itemBuilder: (context, index) => ListTile(
                onTap: () => controller.goToHomeScreen(index),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green.shade700,
                  child: const Icon(Icons.person, color: AppColor.white),
                ),
                title: Text(
                  chatList[index].name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              )),
    );
  }
}
