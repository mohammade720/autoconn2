
  import 'package:autoconn2/part_requisition_detail/product_detail_screen.dart';
  import 'package:autoconn2/product/Product_model.dart';
  import 'package:material_symbols_icons/material_symbols_icons.dart';
  import 'package:flutter/material.dart';

  import '../utils/utils_methods.dart';

  class ProductList extends StatelessWidget {
    final List<Product> products;
    final String filterStatus;

    const ProductList({super.key, required this.products, required this.filterStatus});

    @override
    Widget build(BuildContext context) {
      final filteredProducts = filterStatus == 'All'
      ? products
      : products.where((product) => product.status == filterStatus).toList();

      return Column(
        children: filteredProducts.map((product)=> InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product,)),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration:  BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: const Color(0xFFC5C7CA), width: 0.5
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'PR - ${product.id}',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '. ${product.status}',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: getStatusColor(product.status),
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Symbols.forum,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Symbols.directions_car,size: 20),
                      const SizedBox(width: 8),
                      Text(
                        product.make,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '. ${product.model}',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '. ${product.fuelType}',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Symbols.calendar_month,size: 20),
                      const SizedBox(width: 8),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                              text: "Due On : "
                          ),
                          TextSpan(
                            style: Theme.of(context).textTheme.labelSmall,
                            text: product.dueDate,

                          ),
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Symbols.record_voice_over,size: 20,),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          product.note,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: const Color(0xFFA1A1A1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 28,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F6EA),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        const Text(
                          'Requested Item: ',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            product.requestedItems.map((item) => item.name).join(', '),
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )).toList(),
      );
    }
  }
