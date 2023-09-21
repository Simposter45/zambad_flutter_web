import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../model/manage_pos_model.dart';
import '../store/pos_store.dart';
import 'edit_pos.dart';

class PosScreen extends StatelessWidget {
  const PosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PosStore>(
          create: (_) => PosStore(),
        ),
      ],
      child: ManagePos(),
    );
  }
}

class ManagePos extends StatelessWidget {
  ManagePos({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final posStore = Provider.of<PosStore>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(
        title: 'Manage POS',
        widget: Responsive.isTablet(context) || Responsive.isMobile(context)
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              )
            : const SizedBox(),
        actions: [
          ActionButton(
            icon: Icons.add,
            title: ' Add POS',
            action: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return Provider.value(
                    value: posStore,
                    child: EditPos(posStore: posStore),
                  );
                }),
              );
            },
          ),
        ],
      ),
      drawer: Responsive.isTablet(context) || Responsive.isMobile(context)
          ? const SideBar()
          : null,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Expanded(
              child: Observer(
                builder: (context) {
                  return ListView.builder(
                    itemCount: posStore.posList.length,
                    itemBuilder: (context, index) {
                      final posItem = posStore.posList[index];
                      return PosCard(posItem: posItem);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PosCard extends StatelessWidget {
  const PosCard({
    Key? key,
    required this.posItem,
  }) : super(key: key);

  final ManagePosModel posItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: AppColors.borderGrey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      posItem.posName,
                      style: AppTextStyles.nunitoSansBold,
                    ),
                  ),
                  IconButton(
                      splashRadius: 10,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.info,
                        size: 14,
                        color: AppColors.deepGold,
                      )),
                  IconButton(
                      splashRadius: 10,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 14,
                        color: AppColors.deepGold,
                      )),
                  IconButton(
                      splashRadius: 10,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        size: 14,
                        color: AppColors.deepGold,
                      )),
                ],
              ),
              Text(
                posItem.date,
              ),
              if (posItem.description != null) Text(posItem.description!),
            ],
          ),
        ),
      ),
    );
  }
}
