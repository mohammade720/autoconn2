
import 'package:autoconn2/part_requisition_detail/add_quote_screen.dart';
import 'package:autoconn2/product/Product_model.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '../partitem/part_item_model.dart';
import '../utils/utils_methods.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
 // final PartItem item;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isSearchVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('PR - ${widget.product.id}'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearchVisible = !_isSearchVisible;
              });
            },
            icon: const Icon(Symbols.search, size: 20),
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {
              print('Selected: $value');
            },
            itemBuilder: (BuildContext context) {
              return <String>['Option 1', 'Option 2', 'Option 3']
                  .map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: const Icon(Symbols.more_vert, size: 20),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _isSearchVisible ? buildSearchTextField() : Container(),
            const SizedBox(height: 16),
            buildProductInfoCard(context, widget.product),
            const SizedBox(height: 16),
            buildPartRequisitionCard(context, widget.product),
          ],
        ),
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

Widget buildProductInfoCard(BuildContext context, Product product) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Card(
      elevation: 2,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFEAB308),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Symbols.directions_car, size: 20, color: Colors.white),
                  const SizedBox(width: 14.0),
                  Text(
                    product.make,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                  Text(
                    ' . ${product.model}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                  Text(
                    ' . ${product.fuelType}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Symbols.today, size: 20),
            title: const Text('Requested Date'),
            subtitle: Text(product.dueDate),
          ),
          const Divider(height: 1, color: Color(0xFFA1A1A1)),
          ListTile(
            leading: const Icon(Symbols.schedule, size: 20),
            title: const Text('Due Date'),
            subtitle: Text(product.dueDate),
          ),
          const Divider(height: 1, color: Color(0xFFA1A1A1)),
          ListTile(
            leading: const Icon(Symbols.record_voice_over, size: 20),
            title: const Text('Remarks'),
            subtitle: Text(product.note),
          ),
        ],
      ),
    ),
  );
}

Widget buildPartRequisitionCard(BuildContext context, Product product) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Card(
      elevation: 2,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Symbols.article_shortcut, size: 20),
                const SizedBox(width: 12),
                Text('Part Requisition', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          const Divider(height: 38, color: Color(0xFFA1A1A1)),
          const SizedBox(height: 16),
          Column(
            children: product.requestedItems.map((item) => buildPartItemTile(context,item, product)).toList(),
          ),
        ],
      ),
    ),
  );
}

Widget buildPartItemTile( BuildContext context, PartItem item, product) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              item.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold
                ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 14,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF1F2),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xFFDB0127), width: 0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text('${item.quantity} Qty', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.error)),
              ),
            ),
            const Spacer(),
            Text(
                item.status,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: getStatusColor(product.status),
                ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 4),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text('Part: ${item.partId}', style: Theme.of(context).textTheme.labelSmall),
            const Spacer(),
            ClipOval(
              child: Image.network(
                'https://img.lovepik.com/photo/48007/1912.jpg_wh860.jpg',
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 4),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text('Notes: ${item.notes}', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
      const SizedBox(height: 12),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFFF8F6F4),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text('Buying Choice:', style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold)),
                Text(' ${item.buyingChoice}', style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400)),
                const Spacer(),
                Container(
                  height: 18,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddQuoteScreen(partItem: item)),
                      );
                    },
                    icon: const Icon(Symbols.add, size: 20, color: Color(0xFF40C282)),
                    label: const Text('Add Quote', style: TextStyle(fontSize: 10)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF40C282),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(color: Color(0xFF40C282), width: 0.3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      const Divider(height: 34, color: Color(0xFFA1A1A1)),
    ],
  );
}

