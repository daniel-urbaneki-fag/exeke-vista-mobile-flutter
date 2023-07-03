import 'package:flutter/material.dart';
import 'package:exekevistaapp/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exeke Vista',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
