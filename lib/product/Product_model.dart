class Product {
  final String id;
  final String status;
  final String make;
  final String model;
  final String fuelType;
  final String dueDate;
  final String note;
  final List<String> requestedItems;

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
     requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
  Product(
  id: '0002',
  status: 'SUBMITTED',
  make: 'Suzuki',
  model: 'Swift',
  fuelType: 'Petrol',
  dueDate: '14 JUN 2024',
  note: 'I think I need my brake pads changed and hear sound when I turn.',
  requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
),
  Product(
    id: '0003',
    status: 'PENDING',
    make: 'Suzuki',
    model: 'Swift',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
  Product(
    id: '0004',
    status: 'SUBMITTED',
    make: 'Suzuki',
    model: 'Swift',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
  Product(
    id: '0005',
    status: 'SUBMITTED',
    make: 'Suzuki',
    model: 'Swift',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
  Product(
    id: '0006',
    status: 'PENDING',
    make: 'Suzuki',
    model: 'Swift',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
  Product(
    id: '0007',
    status: 'SUBMITTED',
    make: 'Suzuki',
    model: 'Swift',
    fuelType: 'Petrol',
    dueDate: '14 JUN 2024',
    note: 'I think I need my brake pads changed and hear sound when I turn.',
    requestedItems: ['Air Filter', 'Brake Oil', 'Oil Filter'],
  ),
];
