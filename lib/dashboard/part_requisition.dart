import 'package:autoconn2/part_requisition_detail/history_screen.dart';
import 'package:autoconn2/product/Product_model.dart';
import 'package:autoconn2/product/product_list.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../common_file/filterorderby_dropdown.dart';
import '../common_file/filterworkshop_dropdown.dart';

class PartRequisition extends StatefulWidget {
  PartRequisition({super.key, });

  @override
  State<PartRequisition> createState() => _PartRequisitionState();
}

class _PartRequisitionState extends State<PartRequisition> {
  String dropdownValue = 'All';
  String dropdownValue2 = 'Ascending';
  String dropdownValue3 = 'Due Date';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilterDropdown(
                    label: 'Workshop',
                    dropdownValue: dropdownValue,
                    dropdownItems: const ['All', 'Garage1', 'Garage2'],
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    borderColor: const Color(0xFFEAB308),
                    labelColor: const Color(0xFFEAB308),
                  ),
                  const SizedBox(width: 16),
                  FilterOrderbyDropdown(
                    dropdownValue1: dropdownValue2,
                    dropdownItems1: const ['Ascending', 'Descending'],
                    onChanged1: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                    dropdownValue2: dropdownValue3,
                    dropdownItems2: const ['Due Date', 'Date'],
                    onChanged2: (String? newValue) {
                      setState(() {
                        dropdownValue3 = newValue!;
                      });
                    },
                    borderColor: const Color(0xFFEAB308),
                    labelColor: const Color(0xFFEAB308),
                    dividerColor: const Color(0xFFEAB308),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 36,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Orders',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFA1A1A1),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFA1A1A1),
                    width: 0.5,
                  ),
                ),
                prefixIcon: const Icon(Symbols.search),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildStatusCard(
                  color: const Color(0xFFEAB308),
                  icon: Symbols.outbound,
                  label: 'Total Requested',
                  count: '10',
                ),
                buildStatusCard(
                  color: const Color(0xFF00A261),
                  icon: Symbols.outbound,
                  label: 'Items Quoted',
                  count: '05',
                  rotateIcon: true,
                ),
                buildStatusCard(
                  color: const Color(0xFFDB0127),
                  icon: Symbols.cancel,
                  label: 'Items Rejected',
                  count: '21',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Open Request',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HistoryScreen()),
                  );
                },
                child: const Row(
                  children: [
                    Text(
                      'History',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFEAB308),
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      Symbols.chevron_right,
                      size: 20,
                      color: Color(0xFFEAB308),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ProductList(products: productList,filterStatus: 'PENDING'),
      ],
    );
  }
}

Widget buildStatusCard({
  required Color color,
  required IconData icon,
  required String label,
  required String count,
  bool rotateIcon = false,
}) {
  return Card(
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8),
        // Adjust padding to prevent overflow
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // Distribute space between icon and text
          children: [
            rotateIcon
                ? Transform.rotate(
              angle: 180 * 3.1415927 / 180, // Rotate icon if needed
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            )
                : Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 12), // Space between icon and text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Center vertically
              crossAxisAlignment: CrossAxisAlignment.start,
              // Align text to the start
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  count,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
