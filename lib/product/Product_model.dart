  import 'package:autoconn2/partitem/part_item_model.dart';

class Product {
    final String id;
    final String status;
    final String make;
    final String model;
    final String fuelType;
    final String dueDate;
    final String note;
    final List<PartItem> requestedItems;



    Product({
      required this.id,
      required this.status,
      required this.make,
      required this.model,
      required this.fuelType,
      required this.dueDate,
      required this.note,
      required this.requestedItems,
  });
  }





final List<Product> productList = [

Product(
    id: '0001',
    status: 'PENDING',
    make: 'Suzuki',
    model: 'Swift',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: [
      PartItem(name: 'Air Filter', quantity: 10, status: 'PENDING', partId: 1001, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'Oil Filter', quantity: 10, status: 'PENDING', partId: 1002, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'AC Filter', quantity: 10, status: 'PENDING', partId: 1003, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
    ],
  ),
  Product(
    id: '0002',
    status: 'SUBMITTED',
    make: 'Toyota',
    model: 'Fortuner',
    fuelType: 'Diesel',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: [
      PartItem(name: 'Air Filter', quantity: 10, status: 'SUBMITTED', partId: 1004, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'Oil Filter', quantity: 10, status: 'SUBMITTED', partId: 1005, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'AC Filter', quantity: 10, status: 'SUBMITTED', partId: 1006, notes: 'This is use', buyingChoice: 'OEM, Third Party')

    ],
  ),
  Product(
    id: '0003',
    status: 'PENDING',
    make: 'Suzuki',
    model: 'Ciaz',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: [
      PartItem(name: 'Air Filter', quantity: 10, status: 'PENDING', partId: 1007, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'Oil Filter', quantity: 10, status: 'PENDING', partId: 1008, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'AC Filter', quantity: 10, status: 'PENDING', partId: 1009, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
    ],
  ),
  Product(
    id: '0004',
    status: 'SUBMITTED',
    make: 'Toyota',
    model: 'Etios',
    fuelType: 'Diesel',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: [
      PartItem(name: 'Air Filter', quantity: 10, status: 'SUBMITTED', partId: 1010, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'Oil Filter', quantity: 10, status: 'SUBMITTED', partId: 1011, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'AC Filter', quantity: 10, status: 'SUBMITTED', partId: 1012, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
    ],
  ),
  Product(
    id: '0005',
    status: 'PENDING',
    make: 'Suzuki',
    model: 'Swift',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: [
      PartItem(name: 'Air Filter', quantity: 10, status: 'PENDING', partId: 1013, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'Oil Filter', quantity: 10, status: 'PENDING', partId: 1014, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'AC Filter', quantity: 10, status: 'PENDING', partId: 1015, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
    ],
  ),
  Product(
    id: '0006',
    status: 'SUBMITTED',
    make: 'Toyota',
    model: 'Innova',
    fuelType: 'Diesel',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: [
      PartItem(name: 'Air Filter', quantity: 10, status: 'SUBMITTED', partId: 1016, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'Oil Filter', quantity: 10, status: 'SUBMITTED', partId: 1017, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'AC Filter', quantity: 10, status: 'SUBMITTED', partId: 1018, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
    ],
  ),
  Product(
    id: '0007',
    status: 'PENDING',
    make: 'Suzuki',
    model: 'Vitara Brezza',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: [
      PartItem(name: 'Air Filter', quantity: 10, status: 'PENDING', partId: 1019, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'Oil Filter', quantity: 10, status: 'PENDING', partId: 1020, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'AC Filter', quantity: 10, status: 'PENDING', partId: 1021, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
    ],
  ),
  Product(
    id: '0008',
    status: 'SUBMITTED',
    make: 'Toyota',
    model: 'Corolla',
    fuelType: 'Diesel',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: [
      PartItem(name: 'Air Filter', quantity: 10, status: 'SUBMITTED', partId: 1022, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'Oil Filter', quantity: 10, status: 'SUBMITTED', partId: 1023, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
      PartItem(name: 'AC Filter', quantity: 10, status: 'SUBMITTED', partId: 1024, notes: 'This is use', buyingChoice: 'OEM, Third Party'),
    ],
  ),
];
/*
Product(
    id: '0001',
    status: 'PENDING',
    make: 'Suzuki',
    model: 'Swift',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
  Product(
    id: '0002',
    status: 'SUBMITTED',
    make: 'Toyota',
    model: 'Fortuner',
    fuelType: 'Diesel',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
  Product(
    id: '0003',
    status: 'PENDING',
    make: 'Suzuki',
    model: 'Ciaz',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
  Product(
    id: '0004',
    status: 'SUBMITTED',
    make: 'Toyota',
    model: 'Etios',
    fuelType: 'Diesel',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
  Product(
    id: '0005',
    status: 'PENDING',
    make: 'Suzuki',
    model: 'Swift',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
  Product(
    id: '0006',
    status: 'SUBMITTED',
    make: 'Toyota',
    model: 'Innova',
    fuelType: 'Diesel',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
  Product(
    id: '0007',
    status: 'PENDING',
    make: 'Suzuki',
    model: 'Vitara Brezza',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
  Product(
    id: '0008',
    status: 'SUBMITTED',
    make: 'Toyota',
    model: 'Corolla',
    fuelType: 'Diesel',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
 */