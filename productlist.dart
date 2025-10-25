import 'package:ecommerce/productcontainer.dart';
import 'package:ecommerce/productdetails.dart';
import 'package:flutter/material.dart';
import 'globalvariables.dart';

class productlist extends StatefulWidget {
  const productlist({super.key});

  @override
  State<productlist> createState() => _productlistState();
}
  class _productlistState extends State<productlist> {
    String selectedChip = "All";
  @override
  Widget build(BuildContext context) {
    int currentpage=0;
    final List<String> categories = ["All", "Men", "Women", "Shorts", "Winter"];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Isam's\nCollection",
 1                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = (selectedChip == category);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedChip = category;
                      });
                    },
                    child: Chip(
                      label: Text(
                        category,
                        style: TextStyle(
                          color: (Colors.black),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: isSelected
                            ? Colors.yellow
                            : Colors.black, width: 1.0),
                      ),
                      backgroundColor: isSelected
                          ? Colors.yellow
                          : Colors.white,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              productdetails(product: products[index]),
                        ),
                      );
                    },
                    child: productcontainer(
                      title: products[index]["title"] as String,
                      price: products[index]["price"] as int,
                      image: products[index]["imageUrl"] as String,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
