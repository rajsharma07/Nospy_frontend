import 'package:flutter/material.dart';
// import 'package:nospy/widget/chatpage/chat_page.dart';
// import 'package:nospy/widget/nospy.dart';
import 'package:nospy/widget/authentication/login.dart';
import 'package:nospy/nospy.dart';

class Display extends StatefulWidget{
  const Display({super.key});
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
      debugShowCheckedModeBanner: false,
      home: NoSpy(),
    );
  }
}