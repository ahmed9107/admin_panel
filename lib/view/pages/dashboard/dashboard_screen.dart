import 'package:admin_panel/routes/services/responsive_layout.dart';
import 'package:admin_panel/view/widgets/dashboard/files.dart';
import 'package:admin_panel/view/widgets/dashboard/header.dart';
import 'package:admin_panel/view/widgets/dashboard/recent_files.dart';
import 'package:admin_panel/view/widgets/dashboard/storage_details.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const Files(),
                      const SizedBox(height: 16.0),
                      const RecentFiles(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: 16.0),
                      if (Responsive.isMobile(context)) const StarageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: 16.0),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StarageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
