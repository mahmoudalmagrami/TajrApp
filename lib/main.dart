import 'package:flutter/material.dart';
import 'package:sell/Navigation/navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      home: Navigation(),
      locale: Locale('ar'),
    );
  }
}