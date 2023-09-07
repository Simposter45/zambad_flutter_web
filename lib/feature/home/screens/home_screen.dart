import 'package:first_proj/core/utils/responsive.dart';
import 'package:first_proj/feature/home/screens/desktop_view.dart';
import 'package:first_proj/feature/home/screens/mobile_view.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return MobileView();
    } else {
      return DesktopView();
    }
  }
}
