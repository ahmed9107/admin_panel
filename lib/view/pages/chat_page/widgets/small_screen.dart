import 'package:estore_admin_panel/data/static.dart';
import 'package:estore_admin_panel/view/pages/chat_page/widgets/mobile_chat_screen.dart';
import 'package:estore_admin_panel/view/widgets/user_info_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: usersChatData.length,
        itemBuilder: (context, index) => InkWell(
          onTap: (){
            Get.to(()=> const MobileChatScreen());
          },
          child: UserInfoDetail(
            color: index == 5 ? Theme.of(context).scaffoldBackgroundColor : null,
            info: usersChatData[index],),
        ),
      ),
    );
  }
}