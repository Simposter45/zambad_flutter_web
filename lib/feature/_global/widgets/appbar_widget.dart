import 'package:first_proj/core/constants/colors.dart';
import 'package:first_proj/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    required this.title,
    Key? key,
    this.actions = const [],
    this.widget,
    this.width = 14,
  }) : super(key: key);

  final String title;

  final List<Widget> actions;

  Widget? widget;

  final double width;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      titleSpacing: 0,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.deepGold,
      title: Row(
        children: [
          widget ??
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
          SizedBox(width: width),
          Text(
            title,
            style: AppTextStyles.sairaWhiteBoldMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
