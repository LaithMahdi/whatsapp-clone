import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constant/app_color.dart';
import 'core/constant/app_size.dart';
import 'core/constant/app_string.dart';
import 'routes.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Helvetica",
        primaryColor: AppColor.second,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColor.second, foregroundColor: AppColor.white),
        tabBarTheme: TabBarTheme(
            indicatorColor: AppColor.white,
            labelColor: AppColor.white,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle:
                const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            unselectedLabelColor: AppColor.white.withOpacity(0.5)),
        appBarTheme: const AppBarTheme(
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            color: AppColor.primary,
            foregroundColor: AppColor.white),
        useMaterial3: true,
      ),
      getPages: routes,
    );
  }
}
