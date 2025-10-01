import 'package:flutter/material.dart';
import 'package:store_app/screens/add_product_screen.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_screen.dart';

void main() {
  runApp(
    StoreApp(),
  );
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductScreen.id: (context) => UpdateProductScreen(),
        AddProductScreen.id : (context) => AddProductScreen(),
      },
      initialRoute: HomePage.id,
    );
  }
}
