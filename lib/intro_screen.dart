import 'dart:async';

import 'package:bmi_calculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class introPage extends StatefulWidget{
  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xfffbc2eb),
                Color(0xffa6c1ee),
              ])
        ),
        child: Center(
            child: Text('BMI Calculator', style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w700,
            ),)),

      ),
    );
  }
}