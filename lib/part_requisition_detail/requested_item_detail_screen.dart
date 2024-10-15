import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;


  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isSearchVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PR - ${widget.productId}'),
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
                  String choice){
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
      body: Column(
        children: [
          SizedBox(height: 16),
          _isSearchVisible ? buildSearchTextField() : Container(),
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

/*
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ProductDetailScreen extends StatefulWidget {


  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isSearchVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product ID'),
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
                  String choice){
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
      body: Column(
        children: [
          SizedBox(height: 16),
          _isSearchVisible ? buildSearchTextField() : Container(),
        ],
      ),
    );
  }
}
 */