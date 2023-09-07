import 'package:flutter/material.dart';

import '../../../_global/widgets/action_button.dart';
import '../../../_global/widgets/appbar_widget.dart';

class ManagePos extends StatelessWidget {
  const ManagePos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 300,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Manage POS',
          actions: [
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
