import 'package:autoconn2/product/Product_model.dart';
import 'package:autoconn2/product/product_list.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../common_file/filterorderby_dropdown.dart';
import '../common_file/filterworkshop_dropdown.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool _isSearchVisible = false;

  String filterStatus = 'All';
  String dropdownValue1 = 'Ascending';
  String dropdownValue2 = 'Requested Date';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'History',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearchVisible = !_isSearchVisible;
              });
            },
            icon: const Icon(Symbols.search,size: 20),
          ),
         PopupMenuButton<String>(
           onSelected: (String value) {
             print('Selected: $value');
           },
           itemBuilder: (BuildContext context) {
             return <String>['Option 1', 'Option 2', 'Option 3'].map((
                 String choice) {
               return PopupMenuItem(
                 value: choice,
                 child: Text(choice),
               );
             }).toList();
           },
           icon: const Icon(Symbols.more_vert,size: 20),
         ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          _isSearchVisible ? buildSearchTextField() : Container(),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilterDropdown(
                    label: 'Workshop',
                    dropdownValue: filterStatus,
                    dropdownItems: const ['All', 'PENDING', 'SUBMITTED'],
                    onChanged: (String? newValue) {
                      setState(() {
                        filterStatus = newValue!;
                      });
                    },
                    borderColor: const Color(0xFFD9D9D9),
                    labelColor: const Color(0xFFA1A1A1),
                  ),
                  const SizedBox(width: 16),
                  FilterOrderbyDropdown(
                    dropdownValue1: dropdownValue1,
                    dropdownItems1: const ['Ascending', 'Descending'],
                    onChanged1: (String? newValue) {
                      setState(() {
                        dropdownValue1 = newValue!;
                      });
                    },
                    dropdownValue2: dropdownValue2,
                    dropdownItems2: const ['Requested Date', 'Due Date'],
                    onChanged2: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                    borderColor: const Color(0xFFD9D9D9),
                    labelColor: const Color(0xFFA1A1A1),
                    dividerColor: const Color(0xFFD9D9D9),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ProductList(
              products: productList,
              filterStatus: filterStatus
          ),
        ],
      ),
    );
  }
}

Widget buildSearchTextField() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SizedBox(
      height: 36,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Symbols.search, size: 20),
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
        ),
      ),
    ),
  );
}

