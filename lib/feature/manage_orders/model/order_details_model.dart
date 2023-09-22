import '../../manage_color/model/manage_color_model.dart';
import '../../manage_gold_purity/model/manage_gold_purity_model.dart';
import '../../manage_products/models/manage_product_model.dart';
import '../../manage_states/model/manage_state_model.dart';

class OrderDetailsModel {
  OrderDetailsModel({
    required this.customerEmail,
    required this.orderId,
    required this.pos,
    required this.salesPersonName,
    required this.salesPersonUid,
    required this.extraImages,
    required this.createdAt,
    required this.updatedAt,
    required this.customerName,
    required this.contactPerson,
    required this.phoneNumber,
    required this.address,
    required this.notes,
    required this.city,
    this.emailId,
  });
  final String customerName;
  final String contactPerson;
  final String? emailId;
  final String phoneNumber;
  final String? address;
  final String? notes;
  final List<ManageGoldPurityModel> goldpurity = goldPurityList;
  final List<ManageColorModel> color = colorList;
  final List<ManageStateModel> state = statesList;
  final List<ManageProductModel> products = productsList;
  String city;
  final String customerEmail;
  final String orderId;
  final String pos;
  final String salesPersonName;
  final String salesPersonUid;
  final List<String> extraImages;
  final DateTime createdAt;
  final DateTime updatedAt;
}

List<OrderDetailsModel> orderList = [
  OrderDetailsModel(
    customerEmail: 'customer@email',
    orderId: '1',
    pos: 'POS 1',
    salesPersonName: 'salesPersonName',
    salesPersonUid: 'salesPersonUid',
    extraImages: [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    customerName: 'customer 1',
    contactPerson: 'contactPerson',
    phoneNumber: 'phoneNumber',
    address: 'address',
    notes: 'notes',
    city: 'city',
  ),
  OrderDetailsModel(
    customerEmail: 'customer@email',
    orderId: '2',
    pos: 'POS 2',
    salesPersonName: 'salesPersonName',
    salesPersonUid: 'salesPersonUid',
    extraImages: [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    customerName: 'customer 2',
    contactPerson: 'contactPerson',
    phoneNumber: 'phoneNumber',
    address: 'address',
    notes: 'notes',
    city: 'city',
  ),
  OrderDetailsModel(
    customerEmail: 'customer@email',
    orderId: '4',
    pos: 'POS 3',
    salesPersonName: 'salesPersonName',
    salesPersonUid: 'salesPersonUid',
    extraImages: [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    customerName: 'customer 3',
    contactPerson: 'contactPerson',
    phoneNumber: 'phoneNumber',
    address: 'address',
    notes: 'notes',
    city: 'city',
  ),
  OrderDetailsModel(
    customerEmail: 'customer@email',
    orderId: '5',
    pos: 'POS 4',
    salesPersonName: 'salesPersonName',
    salesPersonUid: 'salesPersonUid',
    extraImages: [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    customerName: 'customer 4',
    contactPerson: 'contactPerson',
    phoneNumber: 'phoneNumber',
    address: 'address',
    notes: 'notes',
    city: 'city',
  ),
  OrderDetailsModel(
    customerEmail: 'customer@email',
    orderId: '6',
    pos: 'POS 5',
    salesPersonName: 'salesPersonName',
    salesPersonUid: 'salesPersonUid',
    extraImages: [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    customerName: 'customer 5',
    contactPerson: 'contactPerson',
    phoneNumber: 'phoneNumber',
    address: 'address',
    notes: 'notes',
    city: 'city',
  ),
];
