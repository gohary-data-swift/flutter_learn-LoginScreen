import 'package:flutter/material.dart';
import 'package:flutter_learn/HomeVC.dart';
import 'package:flutter_learn/LoginVC.dart';

import 'CounterVC.dart';
import 'MessagesVC.dart';
import 'UserVC.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterVC()
    );
  }
}
