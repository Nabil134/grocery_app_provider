import 'package:flutter/material.dart';
import 'package:grocery_app/providers/bottom_navigation_provider.dart';
import 'package:grocery_app/providers/category_provider.dart';
import 'package:grocery_app/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';
import 'views/main/grocery_app_main_page.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BottomNavigationProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CategoryProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => FavoriteProvider(),
          ),
        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GroceryAppMainPage(),
    );
  }
}