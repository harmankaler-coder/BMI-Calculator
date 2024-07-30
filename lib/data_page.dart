import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dataPage extends StatelessWidget{
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
              child: Text('Hello'))),
    );
  }

}