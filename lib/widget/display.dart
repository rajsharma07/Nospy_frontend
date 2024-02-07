import 'package:flutter/material.dart';
import 'package:nospy/widget/home.dart';
import 'package:nospy/widget/login.dart';

class Display extends StatefulWidget{
  Display({super.key});
  @override
  State<Display> createState(){
    return _Display();
  }
}

class _Display extends State<Display>{
  Widget? currentpage;
  @override
  void initState() {
    currentpage = Login(changepage);
    super.initState();
  }
  void changepage(Widget tochange){
    setState(() {
      print('object');
      currentpage = tochange;
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: currentpage,
    );
  }
}