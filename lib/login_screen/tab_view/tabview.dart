import 'package:autoconn2/login_screen/tab_view/company_profile.dart';
import 'package:autoconn2/login_screen/tab_view/tax_information.dart';
import 'package:flutter/material.dart';

class MyTabView extends StatelessWidget {
  const MyTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Color(0xFFEAB308),
            labelColor: Color(0xFFEAB308),
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: 'Company Profile',),
              Tab(text: 'Tax information'),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (String value) {
                print('Selected: $value');
              },
              itemBuilder: (BuildContext context) {
                return <String>['Option 1', 'Option 2', 'Option 3'].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            CompanyProfileScreen(),
            TaxInfoCard(),
          ],
        ),
      ),
    );
  }
}
