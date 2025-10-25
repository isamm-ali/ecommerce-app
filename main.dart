import 'package:ecommerce/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => cartprovider(),
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => cartprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce',
        theme: ThemeData(
          fontFamily: "Ubuntu",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        ),
        home: HomePage(),
      ),
    );
  }
}
