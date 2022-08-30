import 'package:estore_admin_panel/controllers/layout_controller.dart';
import 'package:estore_admin_panel/controllers/manage_customers_controllers/customer_controller.dart';
import 'package:estore_admin_panel/utils/class/custom-scroll_behavior.dart';
import 'package:estore_admin_panel/utils/helpers/dependencies.dart';
import 'package:estore_admin_panel/utils/theme/theme.dart';
import 'package:estore_admin_panel/view/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
      builder: (_) {
        return GetBuilder<LayoutController>(
          builder: (layoutController) {
            return GetMaterialApp(
              scrollBehavior: CustomScrollBehavior(),
              debugShowCheckedModeBanner: false,
              theme: Themes.light,
              darkTheme: Themes.dark,
              themeMode: layoutController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              //getPages: AppRoute.routes,
              home: const Layout(),
            );
          }
        );
      }
    );
  }
}
