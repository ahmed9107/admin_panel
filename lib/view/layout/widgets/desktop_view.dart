import 'package:estore_admin_panel/controllers/layout_controller.dart';
import 'package:estore_admin_panel/view/widgets/desktop_side_menu.dart';
import 'package:estore_admin_panel/view/widgets/top_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).backgroundColor,
      appBar: const TopNavBar(),
      body: GetBuilder<LayoutController>(
        builder: (controller) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: MainDrawer()),
              Expanded(
                flex: 5,
                child: controller.screens[controller.selectedScreen]
              ),
            ],
          );
        }
      )
    );
  }
}