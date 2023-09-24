import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../../manage_categories/models/manage_categories_model.dart';
import '../models/manage_product_model.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key? key, this.productModel}) : super(key: key);

  ManageProductModel? productModel;
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final productNameController = TextEditingController();
  final descController = TextEditingController();
  final designController = TextEditingController();
  final grossWeightPassController = TextEditingController();
  final netWeightPassController = TextEditingController();
  final categoryController = TextEditingController();
  final subCategoryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.productModel != null) {
      productNameController.text = widget.productModel!.title;
      descController.text = widget.productModel!.desc;
      designController.text = widget.productModel!.designId;
      grossWeightPassController.text = widget.productModel!.grossWeight;
      netWeightPassController.text = widget.productModel!.netWeight;
      categoryController.text = widget.productModel!.category;
      subCategoryController.text = widget.productModel!.category;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productNameController.dispose();
    descController.dispose();
    designController.dispose();
    grossWeightPassController.dispose();
    netWeightPassController.dispose();
    categoryController.dispose();
    subCategoryController.dispose();
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
              title: 'Add Products',
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
                    const SizedBox(height: 10),
                    const Text('Name of the Product',
                        style: AppTextStyles.nunitoSansNormal),
                    const SizedBox(height: 5),
                    TextField(
                      controller: productNameController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Product Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide:
                              const BorderSide(color: AppColors.borderGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide:
                              const BorderSide(color: AppColors.borderGrey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Description (Optional)',
                        style: AppTextStyles.nunitoSansNormal),
                    const SizedBox(height: 5),
                    TextField(
                      controller: descController,
                      autofocus: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Enter Description',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide:
                              const BorderSide(color: AppColors.borderGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide:
                              const BorderSide(color: AppColors.borderGrey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Design ID',
                        style: AppTextStyles.nunitoSansNormal),
                    const SizedBox(height: 5),
                    TextField(
                      controller: designController,
                      autofocus: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Enter Design ID',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide:
                              const BorderSide(color: AppColors.borderGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide:
                              const BorderSide(color: AppColors.borderGrey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                        child: Text('Images',
                            style: AppTextStyles.nunitoSansNormal)),
                    const SizedBox(height: 20),
                    Align(
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        const Text('Upload Image: '),
                                        TextButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        AppColors.grey5)),
                                            onPressed: () {},
                                            child: const Text('Choose Files',
                                                style: AppTextStyles
                                                    .nunitoNormal)),
                                        const SizedBox(width: 5),
                                        const Text('NO files Chosen '),
                                        const SizedBox(width: 50),
                                        Expanded(
                                          child: TextButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          AppColors.deepGold)),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Close',
                                                style: AppTextStyles
                                                    .sairaWhiteBoldMedium,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.deepGold)),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '+ Add Images',
                            style: AppTextStyles.sairaWhiteBoldMedium,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Gross Weight (g)',
                        style: AppTextStyles.nunitoSansNormal),
                    const SizedBox(height: 5),
                    TextField(
                      controller: grossWeightPassController,
                      autofocus: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Enter Gross Weight',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide:
                              const BorderSide(color: AppColors.borderGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide:
                              const BorderSide(color: AppColors.borderGrey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Net Weight (g)',
                        style: AppTextStyles.nunitoSansNormal),
                    const SizedBox(height: 5),
                    TextField(
                      controller: netWeightPassController,
                      autofocus: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Enter Net Weight',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide:
                              const BorderSide(color: AppColors.borderGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide:
                              const BorderSide(color: AppColors.borderGrey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Select a Category',
                        style: AppTextStyles.nunitoSansNormal),
                    DropdownMenu(
                      controller: categoryController,
                      initialSelection: 'Select Category',
                      dropdownMenuEntries:
                          categoryList.map<DropdownMenuEntry<String>>((value) {
                        return DropdownMenuEntry<String>(
                          value: value.category,
                          label: value.category,
                        );
                      }).toList(),
                      onSelected: (_) {},
                    ),
                    const SizedBox(height: 20),
                    const Text('Select a Sub-Category',
                        style: AppTextStyles.nunitoSansNormal),
                    DropdownMenu(
                      controller: subCategoryController,
                      initialSelection: 'Select a Sub-Category',
                      dropdownMenuEntries:
                          categoryList.map<DropdownMenuEntry<String>>((value) {
                        return DropdownMenuEntry<String>(
                          value: value.category,
                          label: value.category,
                        );
                      }).toList(),
                      onSelected: (_) {},
                    ),
                    const SizedBox(height: 30),
                    Align(
                      child: TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.deepGold)),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Submit',
                            style: AppTextStyles.sairaWhiteBoldMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
