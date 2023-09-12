class ManageCategoriesModel {
  String category;

  ManageCategoriesModel({required this.category});
}

List<ManageCategoriesModel> getCategories() {
  final List<ManageCategoriesModel> list = [
    ManageCategoriesModel(category: 'Bangle'),
    ManageCategoriesModel(category: 'Bracelet'),
    ManageCategoriesModel(category: 'Chain'),
    ManageCategoriesModel(category: 'EarRings'),
    ManageCategoriesModel(category: 'Long chains'),
    ManageCategoriesModel(category: 'Pendant'),
    ManageCategoriesModel(category: 'Bangle'),
    ManageCategoriesModel(category: 'Bangle'),
    ManageCategoriesModel(category: 'Bangle'),
    ManageCategoriesModel(category: 'Bangle'),
    ManageCategoriesModel(category: 'Bangle'),
  ];

  return list;
}
