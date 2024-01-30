import 'package:flutter/material.dart';
import 'package:nospy/login.dart';

class Display extends StatelessWidget{
  Display({super.key});
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Login(),
    );
  }
}