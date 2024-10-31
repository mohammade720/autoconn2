import 'package:autoconn2/partitem/part_item_model.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:flutter/material.dart';

class AddQuoteScreen extends StatefulWidget {
  final PartItem partItem;

  const AddQuoteScreen({super.key, required this.partItem});

  @override
  State<AddQuoteScreen> createState() => _AddQuoteScreenState();
}

class _AddQuoteScreenState extends State<AddQuoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Quote',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.partItem.name,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Req. QTY',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.partItem.partId}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                  ),
                ),
                Text(
                  '${widget.partItem.quantity} UNT',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 24
              ),
            buildOEMCard(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildOEMCard(BuildContext context) {
  return Card(
    elevation: 1,
    color: Colors.white,
    child: Column(
      children: [
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'OEM',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Remove',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 8,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const SizedBox(height: 22),
              Expanded(child: buildTextField('Rate', prefixIcon: Symbols.asterisk)),
              const SizedBox(width: 16),
              Expanded(child: buildTextField('Quantity', prefixIcon: Symbols.asterisk)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(child: buildTextField('Warranty Number')),
              const SizedBox(width: 16),
              Expanded(child: buildTextField('Days')),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: buildTextField('Delivery Date', prefixIcon: Symbols.calendar_month),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: buildTextField('Notes'),
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: buildMediaAttachments(context),
        ),
        const SizedBox(height: 16),
      ],
    ),
  );
}

Widget buildMediaAttachments(BuildContext context) {
  return Container(
    height: 142,
    decoration: BoxDecoration(
      color: const Color(0xFFF9F9F9),
      border: Border.all(
        color: const Color(0xFFA1A1A1),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            'Attachments',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    ),
  );
}

Widget buildTextField(String label, {IconData? prefixIcon}) {
  return SizedBox(
    height: 36,
    child: TextFormField(
      decoration: InputDecoration(
        labelText: label,
        fillColor: Color(0xFFF9F9F9),
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF172157),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF172157),
            width: 0.5,
          ),
        ),
        prefixIcon: prefixIcon != null
          ?Icon(
          prefixIcon,
          size: 20,
        )
        : null,
      ),
    ),
  );
}