
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
 