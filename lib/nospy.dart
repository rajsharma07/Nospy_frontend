import 'package:flutter/material.dart';
import 'package:nospy/widget/addteam/create_team.dart';
import 'package:nospy/widget/chatapp/chatApp.dart';
import 'package:nospy/widget/dashboard/dashboard.dart';
import 'package:nospy/widget/drawer/drawerwidget.dart';
import 'package:nospy/widget/home/home.dart';

class NoSpy extends StatefulWidget{
  const NoSpy({super.key});

  @override
  State<NoSpy> createState() {
    return _NoSpy();
  }
}

class _NoSpy extends State<NoSpy> {
  Widget activePage = const Home();
  int selectedIndex = 0;
  void shiftPage(int i){
    selectedIndex = i;
    if(i == 0){
      activePage = const Home();
    }
    else if(i == 1){
      activePage = ChatApp();
    }
    else if(i == 2){
      activePage = CreateTeam();
    }
    else if(i == 3){
      activePage = const DashBoard();
    }
    setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('NoSpy')),
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "chat",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business),
            label: 'Create Team',
            backgroundColor: Colors.black, 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Teams',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          shiftPage(value);
        },
      ),

      body: activePage,
    );
  }
}
