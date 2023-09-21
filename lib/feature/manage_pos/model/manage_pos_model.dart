class ManagePosModel {
  ManagePosModel({required this.posName, required this.date, this.description});
  String posName;
  String? description;
  String date;
}

List<ManagePosModel> getPos() {
  final List<ManagePosModel> list = [
    ManagePosModel(
      posName: 'POS 1',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS 2',
      date: '2023-08-30',
      description: 'Description',
    ),
    ManagePosModel(
      posName: 'POS 3',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS 4',
      date: '2023-08-30',
      description: 'Description',
    ),
    ManagePosModel(
      posName: 'POS 5',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS 6',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS 7',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS 8',
      date: '2023-08-30',
      description: 'Description',
    ),
    ManagePosModel(
      posName: 'POS 9',
      date: '2023-08-30',
    ),
    ManagePosModel(
      posName: 'POS30',
      date: '2023-08-30',
    ),
  ];
  return list;
}
