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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationRail(
                backgroundColor: Theme.of(context).backgroundColor,
                selectedIndex: controller.selectedScreen,
                onDestinationSelected: (int index)=> controller.onTapNavBar(index),
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(controller.selectedScreen == 0
                      ? EvaIcons.home : EvaIcons.homeOutline, color: Theme.of(context).primaryColorLight),
                    label: const Text('Dashboard')
                  ),
                  NavigationRailDestination(
                    icon: Icon(controller.selectedScreen == 1
                      ? EvaIcons.pricetags: EvaIcons.pricetagsOutline, color: Theme.of(context).primaryColorLight),
                    label: const Text('products')
                  ),
                  NavigationRailDestination(
                    icon: Icon(controller.selectedScreen == 2
                      ? EvaIcons.shoppingCart : EvaIcons.shoppingCartOutline, color: Theme.of(context).primaryColorLight),
                    label: const Text('Orders')
                  ),
                  NavigationRailDestination(
                    icon: Icon(controller.selectedScreen == 3
                      ? EvaIcons.person : EvaIcons.personOutline, color: Theme.of(context).primaryColorLight),
                    label: const Text('Customers')
                  ),
                  NavigationRailDestination(
                    icon: Icon(controller.selectedScreen == 4
                      ? EvaIcons.messageCircle : EvaIcons.messageCircleOutline, color: Theme.of(context).primaryColorLight),
                    label: const Text('Messages')
                  ),
                ],
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: controller.screens[controller.selectedScreen],
              )),
            ],
          );
        }
      ),
    );
  }
}