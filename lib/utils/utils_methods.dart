import 'package:flutter/material.dart';

import 'enum_variable.dart';



Color getStatusColor(String status) {
  final productStatus = getStatusFromString(status);
  switch (productStatus) {
    case ProductStatus.submitted:
      return const Color(0xFF00A261); // Color for submitted
    case ProductStatus.pending:
      return const Color(0xFFEAB308); // Color for pending
    default:
      return Colors.grey; // Default color for unknown status
  }
}
