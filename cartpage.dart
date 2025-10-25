import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/cartprovider.dart';


class cartpage extends StatelessWidget {
  const cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<cartprovider>(context).cart;
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Cart'))),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                cartItem["imageUrl"].toString(),
              ),
            ),
            title: Text(
              cartItem["title"].toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              "Size: ${cartItem["sizes"].toString()} | Price: ₹${cartItem["price"].toString()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            trailing: IconButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Remove Product?"),
                        content: Text("Are you sure you want to remove this item?"),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          },
                              child: Text("No", style: TextStyle(color: Colors.green),)
                          ),
                          TextButton(onPressed: (){
                            Provider.of<cartprovider>(context, listen: false).removeProduct(cartItem);
                            Navigator.pop(context);
                            },
                              child: Text("Yes",style: TextStyle(color: Colors.red))
                          )
                        ],
                      )
                  );
                },
                icon: Icon(Icons.delete),
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
