import 'package:flutter/material.dart';
import 'package:nospy/login.dart';

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
      currentpage = tochange;
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Container(
        child: currentpage,
      ),
    );
  }
}