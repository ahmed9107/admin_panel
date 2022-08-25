import 'package:estore_admin_panel/utils/services/responsive_layout.dart';
import 'package:estore_admin_panel/view/layout/widgets/desktop_view.dart';
import 'package:estore_admin_panel/view/layout/widgets/mobile_view.dart';
import 'package:estore_admin_panel/view/layout/widgets/tablet_view.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileView: MobileView(),
      tabletView: TabletView(),
      desktopView: DesktopBody(),
    );
  }
}