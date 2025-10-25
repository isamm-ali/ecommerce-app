import 'package:ecommerce/cartpage.dart';
import 'package:ecommerce/productlist.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/cartpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedChip = "All";
  int currentpage = 0;
  List<Widget> pages = const [productlist(), cartpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentpage],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        currentIndex: currentpage,
        onTap: (index) {
          setState(() {
            currentpage = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
        ],
      ),
    );
  }
}
