import 'package:estore_admin_panel/utils/services/responsive_layout.dart';
import 'package:estore_admin_panel/view/pages/dashboard/widgets/desktop_dashboard.dart';
import 'package:estore_admin_panel/view/pages/dashboard/widgets/mobile_dashboard.dart';
import 'package:estore_admin_panel/view/pages/dashboard/widgets/tablet_dashboard.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileView: MobileDashboard(),
      tabletView: TabletDashboard(),
      desktopView: DesktopDashboard(),
    );
  }
}