import 'package:flutter/material.dart';
import 'package:scholar/accueil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Drawer Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Accueil(),
    );
  }
}
