import 'package:estore_admin_panel/controllers/layout_controller.dart';
import 'package:estore_admin_panel/view/widgets/small_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      builder: (controller) {
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            elevation: 1,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      'assets/images/photo1.jpg',
                      height: 38,
                      width: 38,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: SmallText(text: 'Ahmed Azami'),
                ),
              ],
            ),
            actions: [
              InkWell(
                onTap: (){
                  controller.switchTheme();
                },
                child: Icon(EvaIcons.moon, color:Theme.of(context).primaryColorLight)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: InkWell(
                  onTap: (){},
                  child: Icon(EvaIcons.bellOutline, color:Theme.of(context).primaryColorLight)
                ),
              ),
            ],
          ),
          //drawer: const Drawer(child: MainDrawer()),
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: controller.screens[controller.selectedScreen]
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 5.0,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.selectedScreen,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              controller.onTapNavBar(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(controller.selectedScreen == 0
                  ? EvaIcons.home : EvaIcons.homeOutline), label: 'home'.tr),
              BottomNavigationBarItem(
                icon: Icon(controller.selectedScreen == 1
                  ? EvaIcons.pricetags: EvaIcons.pricetagsOutline), label: 'Products'),
              BottomNavigationBarItem(
                icon: Icon(controller.selectedScreen == 2
                  ? EvaIcons.shoppingCart : EvaIcons.shoppingCartOutline), label: 'cart'),
              BottomNavigationBarItem(
                icon: Icon(controller.selectedScreen == 3
                  ? EvaIcons.person : EvaIcons.personOutline), label: 'profile'),
              BottomNavigationBarItem(
                icon: Icon(controller.selectedScreen == 4
                  ? EvaIcons.messageCircle : EvaIcons.messageCircleOutline), label: 'Messages'),
            ],
          )
        );
      }
    );
  }
}