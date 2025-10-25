import 'package:ecommerce/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/cartprovider.dart';
import 'package:provider/provider.dart';

class productdetails extends StatefulWidget {
  final Map<String, Object> product;

  const productdetails({super.key, required this.product});

  @override
  State<productdetails> createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  String selectedsize = "";

  void onTap() {
    if(selectedsize != "") {
      Provider.of<cartprovider>(context, listen: false).addProduct({
        "type": widget.product["type"],
        "title": widget.product["title"],
        "price": widget.product["price"],
        "sizes": selectedsize,
        "imageUrl": widget.product["imageUrl"],
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Added to Cart"),
          ),
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a size"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Details",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    product["title"] as String,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 25),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      product["imageUrl"] as String,
                      height: 386,
                      width: 380,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),
            Container(
              height: 331,
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      "₹${product["price"]}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 50);
                        },
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        scrollDirection: Axis.horizontal,
                        itemCount: (product["sizes"] as List<String>).length,
                        itemBuilder: (context, index) {
                          final size =
                              (product["sizes"] as List<String>)[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedsize = size;
                              });
                            },
                            child: Chip(
                              label: Text(
                                size.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              backgroundColor: selectedsize == size
                                  ? Colors.yellow
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton.icon(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        minimumSize: Size(380, 50),
                      ),
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
