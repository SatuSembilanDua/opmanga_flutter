import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
  //runApp(MainApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: const Color(0xFF222222),
              body: Center(
                child: Container(
                  width: Get.width * 0.5,
                  height: Get.width * 0.5,
                  child: Lottie.asset("assets/imgs/OPManga.json",
                      fit: BoxFit.contain, repeat: false),
                ),
              ),
            ),
          );
        } else {
          return MainApp();
        }
      },
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "OPManga",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
