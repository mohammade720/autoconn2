
//Product Status
enum ProductStatus {
  submitted,
  pending,
}

ProductStatus? getStatusFromString(String status) {
  switch (status.toLowerCase()) {
    case 'submitted':
      return ProductStatus.submitted;
    case 'pending':
      return ProductStatus.pending;
    default:
      return null; // Or handle unknown status appropriately
  }
}


//Part Status
