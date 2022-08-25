import 'package:estore_admin_panel/controllers/layout_controller.dart';
import 'package:estore_admin_panel/view/widgets/on_hover_button.dart';
import 'package:estore_admin_panel/view/widgets/small_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      builder: (controller) {
        return Container(
          //elevation: 0,
          color: Theme.of(context).backgroundColor,
          child: Column(children: [
            OnHoverButton(
              child: ListTile(
                onTap: ()=> controller.onTapNavBar(0),
                leading: Icon(EvaIcons.shoppingCart, color: Theme.of(context).primaryColorLight),
                title: const SmallText(text: 'Dashboard', size: 12),
              ),
            ),
            OnHoverButton(
              child: ListTile(
                onTap: ()=> controller.onTapNavBar(1),
                leading: Icon(EvaIcons.pricetagsOutline, color: Theme.of(context).primaryColorLight),
                title: const SmallText(text: 'Products Manager', size: 12),
              ),
            ),
            OnHoverButton(
              child: ListTile(
                onTap: ()=> controller.onTapNavBar(2),
                leading: Icon(EvaIcons.gridOutline, color: Theme.of(context).primaryColorLight),
                title: const SmallText(text: 'Category Manager', size: 12),
              ),
            ),
            OnHoverButton(
              child: ListTile(
                onTap: ()=> controller.onTapNavBar(3),
                leading: Icon(EvaIcons.person, color: Theme.of(context).primaryColorLight),
                title: const SmallText(text: 'Customer Manager', size: 12),
              ),
            ),
            OnHoverButton(
              child: ListTile(
                onTap: ()=> controller.onTapNavBar(4),
                leading: Icon(EvaIcons.messageCircleOutline, color: Theme.of(context).primaryColorLight),
                title: const SmallText(text: 'Messages', size: 12),
              ),
            ),
            const OnHoverButton(
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: SmallText(text: 'Logout', size: 12, color: Colors.red),
              ),
            ),
          ]),
        );
      }
    );
  }
}