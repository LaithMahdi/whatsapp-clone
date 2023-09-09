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
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(15, 25, 30, 25),
            child: const Text("Welcome to Login Screen",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: AppColor.second)),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 25),
            child: Text("Please choisi user to connect to our app",
                style: TextStyle(fontSize: 13, color: AppColor.blueGrey)),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 5),
              itemCount: chatList.length - 15,
              separatorBuilder: (context, index) => const VerticalSpacer(1),
              itemBuilder: (context, index) => ListTile(
                    onTap: () => controller.goToHomeScreen(index),
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColor.second,
                      child: Icon(Icons.person, color: AppColor.white),
                    ),
                    title: Text(
                      chatList[index].name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  )),
        ],
      ),
    );
  }
}
