import 'package:autoconn2/dashboard/dashboard_tab.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:flutter/material.dart';

class WorkshoplistScreen extends StatefulWidget {
  const WorkshoplistScreen({super.key});

  @override
  State<WorkshoplistScreen> createState() => _WorkshoplistScreenState();
}

class _WorkshoplistScreenState extends State<WorkshoplistScreen> {
  int? _selectedIndex;

  final List<Map<String, String>> _garages = [
    {
      'title': 'A to Z Car Care',
      'phone': '8511669592',
      'address': '1st Floor, Grace Plaza, Behind Marvel Jwellers, Chhapi, Gujarat 385210',
      'imagePath': 'assets/images/Logo.Workshop.png',
    },
    {
      'title': 'Sunasara Garage',
      'phone': '8511669592',
      'address': '1st Floor, Grace Plaza, Behind Marvel Jwellers, Chhapi, Gujarat 385210',
      'imagePath': 'assets/images/Logo.Workshop 2.png',
    },
    {
      'title': 'Elite Bike Care',
      'phone': '8511669592',
      'address': '1st Floor, Grace Plaza, Behind Marvel Jwellers, Chhapi, Gujarat 385210',
      'imagePath': 'assets/images/Logo.Workshop 3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        actions: [
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
            icon: const Icon(Symbols.more_vert),
          ),
        ],
      ),
    body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 36,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search Workshop',
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _garages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GarageListTile(
                          title: _garages[index] ['title']!,
                          phone: _garages[index] ['phone']!,
                          address: _garages[index] ['address']!,
                          imagePath: _garages[index] ['imagePath']!,
                          index: index,
                        selectedIndex: _selectedIndex,
                        onTap: (int selectedIndex) {
                            setState(() {
                              _selectedIndex =selectedIndex;
                            });
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GarageListTile extends StatelessWidget {
  final String title;
  final String phone;
  final String address;
  final String imagePath;
  final int index;
  final int? selectedIndex;
  final ValueChanged<int> onTap;
  const GarageListTile({
    super.key,
    required this.title,
    required this.phone,
    required this.address,
    required this.imagePath,
    required this.index,
    this.selectedIndex,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? const Color(0xFFF9F6EA)
              : Colors.white,
          border: Border.all(
            color: const Color(0xFFA1A1A1),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 20,
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                phone,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
              Text(
                address,
                style: const TextStyle(fontSize: 10, color: Colors.black54),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          trailing: GestureDetector(
            onTap: () {
              onTap(index);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BottomBarScreen()),
              );
            },
            child: const Icon(Symbols.chevron_right, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
