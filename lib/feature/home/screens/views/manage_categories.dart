import 'package:first_proj/feature/_global/widgets/action_button.dart';
import 'package:first_proj/feature/_global/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class ManageCategories extends StatelessWidget {
  const ManageCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 300,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Manage Categories',
          actions: [
            ActionButton(
              icon: Icons.add,
              title: ' Add ',
              action: () {},
            ),
          ],
        ),
      ),
    );
  }
}
