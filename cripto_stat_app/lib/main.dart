// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:cripto_stat_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
        ),
        title: 'Demo app provider',
        home: HomePage());
  }
}
