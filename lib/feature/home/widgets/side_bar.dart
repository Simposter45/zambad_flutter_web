import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/enums/main_page_enums.dart';
import '../../../core/utils/responsive.dart';
import '../../../providers/auth_provider.dart';
import '../store/navigation_store.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationStore = context.read<NavigationStore>();
    return Drawer(
      elevation: Responsive.isDesktop(context) ? 0 : 10,
      width: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset('assets/png/login-page-icon.png'),
            ),

            _SideBarTile(
              iconData: Icons.dashboard_outlined,
              title: "Dashboard",
              store: navigationStore,
              screenType: ScreenType.Dashboard,
            ),
            _SideBarTile(
              iconData: Icons.shopping_bag_outlined,
              title: "Manage Products",
              store: navigationStore,
              screenType: ScreenType.ManageProducts,
            ),
            _SideBarTile(
              iconData: Icons.receipt_long_outlined,
              title: "Manage Orders",
              store: navigationStore,
              screenType: ScreenType.ManageOrders,
            ),
            _SideBarTile(
              iconData: Icons.storefront_outlined,
              title: "Manage POS",
              store: navigationStore,
              screenType: ScreenType.ManagePOS,
            ),
            _SideBarTile(
              iconData: Icons.category_outlined,
              title: "Manage Categories",
              store: navigationStore,
              screenType: ScreenType.ManageCategories,
            ),
            _SideBarTile(
              iconData: Icons.home_work_outlined,
              title: "Manage States",
              store: navigationStore,
              screenType: ScreenType.ManageStates,
            ),
            _SideBarTile(
              iconData: Icons.group_outlined,
              title: "Manage Users",
              store: navigationStore,
              screenType: ScreenType.ManageUsers,
            ),
            _SideBarTile(
              iconData: Icons.money_rounded,
              title: "Manage Gold Purity",
              store: navigationStore,
              screenType: ScreenType.ManageGoldPurity,
            ),
            _SideBarTile(
              iconData: Icons.color_lens_outlined,
              title: "Manage Color",
              store: navigationStore,
              screenType: ScreenType.ManageColor,
            ),
            _SideBarTile(
              iconData: Icons.logout_outlined,
              title: "Logout",
              store: navigationStore,
              screenType: ScreenType.Logout,
            ),
          ],
        ),
      ),
    );
  }
}

class _SideBarTile extends StatelessWidget {
  const _SideBarTile({
    required this.iconData,
    required this.title,
    required this.store,
    required this.screenType,
    Key? key,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final NavigationStore store;
  final ScreenType screenType;

  @override
  Widget build(BuildContext context) {
    final authprovider = AuthProvider();

    return Observer(builder: (context) {
      final isHovered = store.hoveredType == screenType;
      final isSelected = store.currentType == screenType;

      return InkWell(
        onTap: () async {
          if (screenType == ScreenType.Logout) {
            await authprovider
                .logout(context)
                .whenComplete(() => Navigator.of(context).pop());
          }
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          store.setCurrentType(screenType);
        },
        onHover: (value) {
          if (value) {
            store.setHoveredType(screenType);
          } else {
            store.setHoveredType(null);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isHovered || isSelected ? AppColors.deepGold : Colors.white,
          ),
          child: Row(
            children: [
              Icon(
                iconData,
                color: isHovered || isSelected ? Colors.white : Colors.black,
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  color: isHovered || isSelected ? Colors.white : Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
