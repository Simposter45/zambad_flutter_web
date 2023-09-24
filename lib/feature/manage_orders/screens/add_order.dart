import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../_global/widgets/text_field_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../../manage_color/model/manage_color_model.dart';
import '../../manage_gold_purity/model/manage_gold_purity_model.dart';
import '../../manage_pos/model/manage_pos_model.dart';
import '../../manage_states/model/manage_state_model.dart';
import '../model/order_details_model.dart';

class AddOrders extends StatefulWidget {
  const AddOrders({Key? key, this.orderModel}) : super(key: key);

  @override
  State<AddOrders> createState() => _AddOrdersState();
  final OrderDetailsModel? orderModel;
}

class _AddOrdersState extends State<AddOrders> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final customerNameController = TextEditingController();
  final contactPersonController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();
  final subnotesController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.orderModel != null) {
      // productNameController.text = widget.orderModel!.;
      // contactPersonController.text = widget.orderModel!.contactPerson;
      // emailController.text = widget.orderModel!.designId;
      // phoneController.text = widget.orderModel!.grossWeight;
      // addressController.text = widget.orderModel!.netWeight;
      // notesController.text = widget.orderModel!.category;
      // subnotesController.text = widget.orderModel!.category;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    customerNameController.dispose();
    contactPersonController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    notesController.dispose();
    subnotesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            Container(
              alignment: Alignment.topCenter,
              child: const SideBar(),
            ),
          Expanded(
              child: Scaffold(
            key: _scaffoldKey,
            drawer: Responsive.isTablet(context) || Responsive.isMobile(context)
                ? const SideBar()
                : null,
            appBar: AppBarWidget(
              title: 'Create Orders',
              widget:
                  Responsive.isTablet(context) || Responsive.isMobile(context)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        )
                      : null,
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  const Text('Basic Info', style: AppTextStyles.nunitoSansBold),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                      controller: customerNameController,
                      titleText: 'Customer Name',
                      hintText: 'Enter Customer Name'),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                      controller: contactPersonController,
                      titleText: 'Contact Person',
                      hintText: 'Enter Contact Person'),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                      controller: emailController,
                      titleText: 'Email ID',
                      hintText: 'Enter Email ID'),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                      controller: phoneController,
                      titleText: 'Phone Number',
                      hintText: 'Enter Phone Number'),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                      controller: addressController,
                      titleText: 'Address',
                      hintText: 'Enter Phone Number'),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                      controller: addressController,
                      titleText: 'Address',
                      hintText: 'Enter Address'),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                      controller: phoneController,
                      titleText: 'Notes',
                      hintText: 'Enter notes'),
                  const SizedBox(height: 20),
                  const Text('Preferred Gold Purity',
                      style: AppTextStyles.nunitoSansNormal),
                  DropdownMenu(
                    // controller: notesController,
                    initialSelection: 'Select Category',
                    dropdownMenuEntries:
                        goldPurityList.map<DropdownMenuEntry<String>>((value) {
                      return DropdownMenuEntry<String>(
                        value: value.goldPurity,
                        label: value.goldPurity,
                      );
                    }).toList(),
                    onSelected: (_) {},
                  ),
                  const SizedBox(height: 20),
                  const Text('Preferred Color',
                      style: AppTextStyles.nunitoSansNormal),
                  DropdownMenu(
                    // controller: notesController,
                    initialSelection: 'Select Category',
                    dropdownMenuEntries:
                        colorList.map<DropdownMenuEntry<String>>((value) {
                      return DropdownMenuEntry<String>(
                        value: value.color,
                        label: value.color,
                      );
                    }).toList(),
                    onSelected: (_) {},
                  ),
                  const SizedBox(height: 20),
                  const Text('Preferred Pos',
                      style: AppTextStyles.nunitoSansNormal),
                  DropdownMenu(
                    // controller: notesController,
                    initialSelection: 'Select Category',
                    dropdownMenuEntries:
                        posList.map<DropdownMenuEntry<String>>((value) {
                      return DropdownMenuEntry<String>(
                        value: value.posName,
                        label: value.posName,
                      );
                    }).toList(),
                    onSelected: (_) {},
                  ),
                  const SizedBox(height: 20),
                  const Text('Preferred State',
                      style: AppTextStyles.nunitoSansNormal),
                  DropdownMenu(
                    // controller: notesController,
                    initialSelection: 'Select Category',
                    dropdownMenuEntries:
                        statesList.map<DropdownMenuEntry<String>>((value) {
                      return DropdownMenuEntry<String>(
                        value: value.state,
                        label: value.state,
                      );
                    }).toList(),
                    onSelected: (_) {},
                  ),
                  const SizedBox(height: 20),
                  const Align(
                      child: Text('Images',
                          style: AppTextStyles.nunitoSansNormal)),
                  Align(
                      child: Text('Upload 1 or more than 1',
                          style: AppTextStyles.nunitoSansNormal
                              .copyWith(color: AppColors.grey5))),
                  const SizedBox(height: 20),
                  Align(
                      child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      constraints: BoxConstraints(
                        minHeight: Responsive.isDesktop(context) ? 300 : 100,
                        minWidth: Responsive.isDesktop(context) ? 300 : 100,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.grey5,
                          border: Border.all(color: AppColors.deepGold),
                          borderRadius: BorderRadius.circular(7)),
                      child: Column(
                        children: [
                          if (Responsive.isDesktop(context))
                            const Text('Drag and Drop Images here'),
                          const SizedBox(height: 100),
                          const Icon(Icons.add_a_photo),
                        ],
                      ),
                    ),
                  )),
                  const SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Cart Items',
                            style: AppTextStyles.nunitoSansNormal),
                        TextButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColors.deepGold)),
                            onPressed: () {},
                            child: const Text(
                              '+ Add Product',
                              style: AppTextStyles.sairaWhiteBoldMedium,
                            ))
                      ]),
                  const SizedBox(height: 40),
                  Align(
                    child: TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.deepGold)),
                        onPressed: () {},
                        child: const Text(
                          'Create Order',
                          style: AppTextStyles.sairaWhiteBoldMedium,
                        )),
                  )
                ],
              ),
            )),
          )),
        ],
      ),
    );
  }
}
