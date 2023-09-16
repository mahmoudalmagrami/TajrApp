import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sell/Navigation/navigation.dart';
import 'package:sell/base_controller.dart';

void main() async{

  await GetStorage.init();


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