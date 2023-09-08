import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home/home_controller.dart';
import '../../core/constant/app_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImpl controller = Get.put(HomeControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.appName),
        actions: [
          IconButton(
              onPressed: () => controller.goToCameraScreen(),
              icon: const Icon(Icons.camera_alt_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton(
            onSelected: (value) => controller.selectPopMenu(value),
            itemBuilder: (context) {
              return List.generate(
                  controller.popMenuItems.length,
                  (index) => PopupMenuItem(
                      value: controller.popMenuItems[index],
                      child: Text(controller.popMenuItems[index])));
            },
          )
        ],
        bottom: TabBar(controller: controller.tabController, tabs: [
          ...List.generate(controller.tabs.length, (index) {
            return Tab(
              child: index == 0
                  ? Icon(controller.tabs[index])
                  : Text("${controller.tabs[index]}".toUpperCase()),
            );
          })
        ]),
      ),
      body: TabBarView(
          controller: controller.tabController,
          children: List.generate(controller.tabBarViews.length,
              (index) => controller.tabBarViews[index])),
    );
  }
}
