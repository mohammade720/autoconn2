import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class FilterOrderbyDropdown extends StatelessWidget {
  final String dropdownValue1;
  final List<String> dropdownItems1;
  final ValueChanged<String?> onChanged1;
  final String dropdownValue2;
  final List<String> dropdownItems2;
  final ValueChanged<String?> onChanged2;
  final Color borderColor;
  final Color labelColor;
  final Color dividerColor; // Add this line

  const FilterOrderbyDropdown({
    Key? key,
    required this.dropdownValue1,
    required this.dropdownItems1,
    required this.onChanged1,
    required this.dropdownValue2,
    required this.dropdownItems2,
    required this.onChanged2,
    this.borderColor = const Color(0xFFEAB308),
    this.labelColor = const Color(0xFFEAB308),
    this.dividerColor = const Color(0xFFEAB308), // Add default value for divider color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: borderColor, // Custom border color
          width: 0.4,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      height: 24,
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Order by',
                style: TextStyle(
                  fontSize: 10,
                  color: labelColor, // Custom label color
                ),
              ),
              const SizedBox(width: 3),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue1,
                  icon: const Icon(Symbols.arrow_drop_down, size: 20),
                  onChanged: onChanged1,
                  items: dropdownItems1
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 10),
                      ),
                    );
                  }).toList(),
                ),
              ),
              VerticalDivider(
                width: 10,
                thickness: 1,
                color: dividerColor, // Use custom divider color
              ),
              Text(
                'With',
                style: TextStyle(
                  fontSize: 10,
                  color: labelColor, // Custom label color
                ),
              ),
              const SizedBox(width: 3),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue2,
                  icon: const Icon(Symbols.arrow_drop_down, size: 20),
                  onChanged: onChanged2,
                  items: dropdownItems2
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 10),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
