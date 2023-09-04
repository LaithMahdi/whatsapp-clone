import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/core/constant/app_color.dart';
import 'package:whatsapp_clone/core/constant/app_string.dart';

import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.primary,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColor.primary, foregroundColor: AppColor.white),
        tabBarTheme: TabBarTheme(
            indicatorColor: AppColor.white,
            labelColor: AppColor.white,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: AppColor.white.withOpacity(0.5)),
        appBarTheme: const AppBarTheme(
            color: AppColor.primary, foregroundColor: AppColor.white),
        useMaterial3: true,
      ),
      getPages: routes,
    );
  }
}
