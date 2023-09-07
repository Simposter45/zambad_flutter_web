class ManagePosModel {
  ManagePosModel({required this.posName, required this.date, this.description});
  String posName;
  String? description;
  String date;
}

List<ManagePosModel> getPos() {
  final List<ManagePosModel> list = [
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
      description: 'Description',
    ),
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
      description: 'Description',
    ),
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
      description: 'Description',
    ),
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
    ),
  ];
  return list;
}
