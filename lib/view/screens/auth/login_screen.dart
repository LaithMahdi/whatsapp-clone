import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controllers/auth/login_controller.dart';
import 'package:whatsapp_clone/data/data%20source/chat_list.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => controller.goToHomeScreen(index),
          child: Text(chatList[index].name),
        ),
      ),
    );
  }
}
