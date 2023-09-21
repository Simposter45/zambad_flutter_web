import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../models/manage_categories_model.dart';
import '../../_global/widgets/alert_dialog_box.dart';

class ManageCategories extends StatefulWidget {
  ManageCategories({Key? key}) : super(key: key);

  @override
  State<ManageCategories> createState() => _ManageCategoriesState();
}

class _ManageCategoriesState extends State<ManageCategories> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<ManageCategoriesModel> categories = getCategories();

  final textController = TextEditingController();

  void removeItem(BuildContext context, ManageCategoriesModel category) {
    setState(() {
      categories.removeWhere((element) => element == category);
    });
  }

  Future<void> editItem(BuildContext context, String initialValue) async {
    final TextEditingController controller =
        TextEditingController(text: initialValue);

    final editedCategory = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialogBox(
          textController: controller,
          buttonName: 'Update',
          screenName: 'Category',
        );
      },
    );

    if (editedCategory != null && editedCategory.isNotEmpty) {
      final index = categories
          .indexWhere((category) => category.category == initialValue);

      if (index != -1) {
        setState(() {
          categories[index] = ManageCategoriesModel(category: editedCategory);
        });
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(
        title: 'Manage Categories',
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
            title: ' Add ',
            action: () async {
              final category = await addItem(context, textController);
              if (category != null && category != "") {
                setState(() {
                  categories.add(ManageCategoriesModel(category: category));
                });
              }
            },
          ),
        ],
      ),
      drawer: Responsive.isTablet(context) || Responsive.isMobile(context)
          ? const SideBar()
          : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryCard(
              category: category,
              onDelete: () {
                removeItem(context, category);
              },
              onEdit: (editedCategory) {
                editItem(context, editedCategory);
              },
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    required this.onDelete,
    required this.onEdit,
    Key? key,
  }) : super(key: key);

  final ManageCategoriesModel category;
  final VoidCallback onDelete;
  final Function(String) onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                category.category,
                style: AppTextStyles.nunitoSansBold,
              ),
            ),
          )),
          const VerticalDivider(color: AppColors.borderGrey),
          IconButton(
              onPressed: () => onEdit(category.category),
              splashRadius: 10,
              icon: const Icon(
                Icons.edit,
                color: AppColors.deepGold,
                size: 16,
              )),
          IconButton(
              onPressed: onDelete,
              splashRadius: 10,
              icon: const Icon(
                Icons.delete,
                color: AppColors.deepGold,
                size: 16,
              )),
        ],
      ),
    );
  }
}
