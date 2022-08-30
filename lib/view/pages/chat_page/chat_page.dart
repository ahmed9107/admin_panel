import 'package:estore_admin_panel/utils/services/responsive_layout.dart';
import 'package:estore_admin_panel/view/pages/chat_page/widgets/large_screen.dart';
import 'package:estore_admin_panel/view/pages/chat_page/widgets/small_screen.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileView: SmallScreen(),
      tabletView: LargeScreen(),
      desktopView: LargeScreen(),
    );
  }
}