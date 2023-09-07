import 'package:first_proj/core/constants/colors.dart';
import 'package:first_proj/core/constants/styles.dart';
import 'package:first_proj/feature/_global/widgets/action_button.dart';
import 'package:first_proj/feature/_global/widgets/appbar_widget.dart';
import 'package:first_proj/feature/home/model/latest_customer_model.dart';
import 'package:first_proj/feature/home/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final List<LatestCustomerModel> orderList = getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBarWidget(title: 'Dashboard', widget: const SizedBox(), actions: [
        ActionButton(
          icon: Icons.refresh,
          title: 'Refresh',
          action: () {},
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HeaderWidget(
                        text: 'Total Number of Orders',
                        amount: 0,
                        icon: Icons.bar_chart_rounded,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      const HeaderWidget(
                          text: 'Total No. of Products',
                          amount: 0,
                          icon: Icons.shopping_bag_outlined),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      const HeaderWidget(
                          text: 'Total No. of POS',
                          amount: 0,
                          icon: Icons.storefront_rounded)
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.deepGold),
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Latest Orders',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                    ),
                    if (orderList.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Container(
                        height: 54,
                        decoration: const BoxDecoration(color: AppColors.grey5),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Order Id',
                              style: AppTextStyles.nunitoSansBold,
                            ),
                            Text(
                              'POS',
                              style: AppTextStyles.nunitoSansBold,
                            ),
                            Text(
                              'DATE',
                              style: AppTextStyles.nunitoSansBold,
                            ),
                            Text(
                              'Customer Name',
                              style: AppTextStyles.nunitoSansBold,
                            ),
                            Text(
                              'Action',
                              style: AppTextStyles.nunitoSansBold,
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: orderList.length,
                        itemBuilder: (context, index) {
                          final model = orderList[index];
                          return Table(
                            border: const TableBorder(
                                bottom: BorderSide(color: AppColors.grey7)),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FlexColumnWidth(4.5),
                              1: FlexColumnWidth(3),
                              2: FlexColumnWidth(4),
                              3: FlexColumnWidth(5),
                              4: FlexColumnWidth(4),
                            },
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(children: [
                                Container(
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text(
                                      model.orderId,
                                      style: AppTextStyles.sairaGoldSmall,
                                    )),
                                Container(
                                    alignment: Alignment.center,
                                    child: Text(model.pos)),
                                Container(
                                    alignment: Alignment.center,
                                    child: Text(model.date)),
                                Container(
                                    alignment: Alignment.center,
                                    child: Text(model.customerName)),
                                Container(
                                    alignment: Alignment.center,
                                    child: const Icon(Icons.info)),
                              ]),
                            ],
                          );
                        },
                      ),
                    ]
                  ],
                ),
              ),
            ]),
            if (orderList.isEmpty)
              const Center(
                child: Text(
                  'No latest orders',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.sairaLightGrey,
                ),
              )
          ],
        ),
      ),
    );
  }
}