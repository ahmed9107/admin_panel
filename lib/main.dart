import 'package:admin_panel/controllers/menu_controller.dart';
import 'package:admin_panel/routes/constants/colors.dart';
import 'package:admin_panel/view/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  Get.lazyPut(()=> MenuController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: AppColors.secondaryColor,
      ),
      home: GetBuilder<MenuController>(
        builder: (_) {
          return const HomePage();
        }
      ),
    );
  }
}