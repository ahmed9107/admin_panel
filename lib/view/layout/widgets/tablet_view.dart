import 'package:estore_admin_panel/controllers/layout_controller.dart';
import 'package:estore_admin_panel/view/widgets/top_navbar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabletView extends StatelessWidget {
  const TabletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavBar(),
      //drawer: Drawer(child: MainDrawer()),
      body: GetBuilder<LayoutController>(
        builder: (controller) {
          return Row(
            children: [
              NavigationRail(
                backgroundColor: Theme.of(context).backgroundColor,
                selectedIndex: controller.selectedScreen,
                onDestinationSelected: (int index)=> controller.onTapNavBar(index),
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(EvaIcons.home, color: Theme.of(context).primaryColorLight),
                    label: const Text('Dashboard')
                  ),
                  NavigationRailDestination(
                    icon: Icon(EvaIcons.pricetagsOutline, color: Theme.of(context).primaryColorLight),
                    label: const Text('products')
                  ),
                  NavigationRailDestination(
                    icon: Icon(EvaIcons.shoppingCart, color: Theme.of(context).primaryColorLight),
                    label: const Text('Orders')
                  ),
                  NavigationRailDestination(
                    icon: Icon(EvaIcons.person, color: Theme.of(context).primaryColorLight),
                    label: const Text('Customers')
                  ),
                  NavigationRailDestination(
                    icon: Icon(EvaIcons.messageCircleOutline, color: Theme.of(context).primaryColorLight),
                    label: const Text('Messages')
                  ),
                ],
              ),
              Expanded(child: controller.screens[controller.selectedScreen]),
            ],
          );
        }
      ),
    );
  }
}