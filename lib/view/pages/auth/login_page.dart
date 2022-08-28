import 'package:estore_admin_panel/utils/services/responsive_layout.dart';
import 'package:estore_admin_panel/view/pages/auth/widgets/large_screen_login.dart';
import 'package:estore_admin_panel/view/pages/auth/widgets/mobile_login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileView: MobileLogin(),
      tabletView: LargeScreenLogin(),
      desktopView: LargeScreenLogin(),
    );
  }
}