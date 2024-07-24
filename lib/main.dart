import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushirestaurantapp/models/shop.dart';
import 'package:sushirestaurantapp/views/intro_page.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: IntroPage(),
    );
  }
}