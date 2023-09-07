import 'package:first_proj/feature/_global/widgets/appbar_widget.dart';
import 'package:first_proj/feature/_global/widgets/action_button.dart';
import 'package:flutter/material.dart';

class ManageOrders extends StatelessWidget {
  const ManageOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 300,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Manage Orders',
          actions: [
            ActionButton(
              title: 'Generate Excel',
              action: () {},
            ),
            ActionButton(
              icon: Icons.add,
              title: ' Add Product',
              action: () {},
            ),
          ],
        ),
      ),
    );
  }
}