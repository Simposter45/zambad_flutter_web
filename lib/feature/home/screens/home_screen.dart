import 'package:flutter/material.dart';

import '../../../core/utils/responsive.dart';
import 'desktop_view.dart';
import 'mobile_view.dart';
import 'tablet_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return MobileView();
    } else if (Responsive.isTablet(context)) {
      return TabletView();
    } else {
      return const DesktopView();
    }
  }
}
