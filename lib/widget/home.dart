import 'package:flutter/material.dart';
import 'package:nospy/widget/dashboard/dashboard.dart';
import 'package:nospy/widget/drawerwidget.dart';

class Home extends StatelessWidget{
  const Home({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('NoSpy')),),
      drawer: DrawerWidget(),
      body: DashBoard(),
    );
  }
}