import 'package:estore_admin_panel/controllers/layout_controller.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/small_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopNavBar extends StatelessWidget  with PreferredSizeWidget{
  const TopNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
      title: Row(children: [
        Image.asset('assets/images/a.png', height: 35),
        const SizedBox(width: 10.0),
        const BigText(text: 'Azami'),
      ]),
      actions: [
        Row(
          children: [
            GetBuilder<LayoutController>(
              builder: (controller) {
                return InkWell(
                  onTap: (){
                    controller.switchTheme();
                  },
                  child: Icon(EvaIcons.moon, color:Theme.of(context).primaryColorLight)
                );
              }
            ),
            const SizedBox(width:10),
            InkWell(
              onTap: (){},
              child: Icon(EvaIcons.bellOutline, color:Theme.of(context).primaryColorLight)
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: 1,
              height: 30,
              color: const Color(0xFFA4A6B3),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: SmallText(text: 'Ahmed Azami'),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(40/2)
              )
            ),
          ],
        ),
      ]
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}