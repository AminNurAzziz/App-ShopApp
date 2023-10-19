import 'package:flutter/material.dart';
import 'package:shopapp/cart_page.dart';
import 'package:shopapp/global_variables.dart';
import 'package:shopapp/product_card.dart';
import 'package:shopapp/product_detail_page.dart';
import 'package:shopapp/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = [
    const ProductList(),
    CartPage(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) => setState(() {
          currentPage = value;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          )
        ],
      ),
    );
  }
}
