import 'package:autoconn2/dashboard/bill.dart';
import 'package:autoconn2/dashboard/part_purchase.dart';
import 'package:autoconn2/dashboard/part_requisition.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';


class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndexValue=0;
  List ScreenList=[
    PartRequisition(),
    const PartPurchase(),
    const Bill(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
       body: ScreenList[currentIndexValue],
       bottomNavigationBar: BottomNavigationBar(
         backgroundColor: Colors.white,
         selectedItemColor: Color(0xFFDFF0FA),
         unselectedItemColor: Colors.black,
         onTap: (index) {
           setState(() {
             currentIndexValue = index;
           });
         },
         currentIndex: currentIndexValue,
         items: const [
           BottomNavigationBarItem(
               icon: Icon(Symbols.article_shortcut,size: 16),
               label: "Part Requisition"
           ),
           BottomNavigationBarItem(
               icon: Icon(Symbols.shopping_cart,size: 16),
               label: "Part Purchase"
           ),
           BottomNavigationBarItem(
               icon: Icon(Symbols.receipt_long,size: 16),
               label: "Bill"
           ),
         ],
       ),
    );
  }
}
