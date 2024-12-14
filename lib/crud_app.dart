import 'package:crud/screens/add_product_screen.dart';
import 'package:crud/screens/product_list_screen.dart';
import 'package:crud/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

import 'model/product.dart';

class CRUDApp extends StatelessWidget {
  const CRUDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CRUD Application",
      theme: ThemeData(
        primaryColor: Colors.orange,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.orange),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.orange,
              minimumSize: const Size(double.infinity, 50),
              textStyle: const TextStyle(fontSize: 18) // Button text color
              ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == '/') {
          widget = const ProductListScreen();
        } else if (settings.name == AddProductScreen.name) {
          widget = const AddProductScreen();
        } else if (settings.name == UpdateProductScreen.name) {
          final Product product = settings.arguments as Product;
          widget = UpdateProductScreen(product: product);
        }

        return MaterialPageRoute(
          builder: (context) {
            return widget;
          },
        );
      },
    );
  }
}
