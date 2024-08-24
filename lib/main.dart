import 'package:flutter/material.dart';
import 'package:sello_store_app/screens/home_screen.dart';
import 'package:sello_store_app/screens/update_product_screen.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductScreen.id: (context) => UpdateProductScreen(),
      },
      initialRoute: HomePage.id,
    );
  }
}
