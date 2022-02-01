import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/home/HomeVC.dart';
import 'package:flutter_learn/modules/login/LoginVC.dart';

import 'layout/home_layout.dart';
import 'modules/bmi/BMICalculatorVC.dart';
import 'modules/bmi_result/BMI_resulte.dart';
import 'modules/counter/CounterVC.dart';
import 'modules/messeges/MessagesVC.dart';
import 'modules/users/UserVC.dart';

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
      home: HomeLayout()
    );
  }
}
