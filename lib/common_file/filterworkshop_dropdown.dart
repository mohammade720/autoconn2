import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class FilterDropdown extends StatelessWidget {
  final String label;
  final String dropdownValue;
  final List<String> dropdownItems;
  final ValueChanged<String?> onChanged;
  final Color borderColor; // Existing parameter for border color
  final Color labelColor;  // New parameter for label color

  const FilterDropdown({
    Key? key,
    required this.label,
    required this.dropdownValue,
    required this.dropdownItems,
    required this.onChanged,
    this.borderColor = const Color(0xFFEAB308), // Default border color
    this.labelColor = const Color(0xFFEAB308),  // Default label color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: borderColor, // Use the borderColor parameter
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
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: labelColor, // Use the labelColor parameter
                ),
              ),
              const SizedBox(width: 3),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Symbols.arrow_drop_down, size: 20),
                  onChanged: onChanged,
                  items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
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
