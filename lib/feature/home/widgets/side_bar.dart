import 'package:first_proj/core/constants/colors.dart';
import 'package:first_proj/core/utils/responsive.dart';
import 'package:first_proj/feature/home/store/navigation_store.dart';
import 'package:first_proj/providers/auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final navigationStore = NavigationStore();

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: Responsive.isDesktop(context) ? 0 : 10,
      width: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Image.asset('assets/png/login-page-icon.png'),
            ),

            _SideBarTile(
              iconData: Icons.dashboard_outlined,
              title: "Dashboard",
              store: navigationStore,
              screenIndex: 0,
            ),
            _SideBarTile(
              iconData: Icons.shopping_bag_outlined,
              title: "Manage Products",
              store: navigationStore,
              screenIndex: 1,
            ),
            _SideBarTile(
              iconData: Icons.receipt_long_outlined,
              title: "Manage Orders",
              store: navigationStore,
              screenIndex: 2,
            ),
            _SideBarTile(
              iconData: Icons.storefront_outlined,
              title: "Manage POS",
              store: navigationStore,
              screenIndex: 3,
            ),
            _SideBarTile(
              iconData: Icons.category_outlined,
              title: "Manage Categories",
              store: navigationStore,
              screenIndex: 4,
            ),
            _SideBarTile(
              iconData: Icons.group_outlined,
              title: "Manage Users",
              store: navigationStore,
              screenIndex: 5,
            ),
            _SideBarTile(
              iconData: Icons.logout_outlined,
              title: "Logout",
              store: navigationStore,
              screenIndex: 6,
            ),
          ],
        ),
      ),
    );
  }
}

class _SideBarTile extends StatelessWidget {
  const _SideBarTile({
    Key? key,
    required this.iconData,
    required this.title,
    required this.store,
    required this.screenIndex,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final NavigationStore store;
  final int screenIndex;

  @override
  Widget build(BuildContext context) {
    final authprovider = AuthProvider();

    return Observer(builder: (context) {
      final isHovered = store.hoveredIndex == screenIndex;
      final isSelected = store.currentIndex == screenIndex;

      return InkWell(
        onTap: () {
          if (screenIndex == 6) {
            authprovider
                .logout(context)
                .whenComplete(() => Navigator.of(context).pop());
          }
          store.setCurrentIndex(screenIndex);
        },
        onHover: (value) {
          if (value) {
            store.setHoveredIndex(screenIndex);
          } else {
            store.setHoveredIndex(-1);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: isHovered || isSelected ? AppColors.deepGold : Colors.white,
          ),
          child: Row(
            children: [
              Icon(
                iconData,
                color: isHovered || isSelected ? Colors.white : Colors.black,
              ),
              const SizedBox(width: 20.0),
              Text(
                title,
                style: TextStyle(
                  color: isHovered || isSelected ? Colors.white : Colors.black,
                  fontSize: 18.0,
                ),
              ),
              Text(
                store.currentIndex.toString(),
                style: TextStyle(
                  color: isHovered || isSelected ? Colors.white : Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
