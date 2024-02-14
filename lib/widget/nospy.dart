import 'package:flutter/material.dart';
import 'package:nospy/widget/chatpage/chat_page.dart';
import 'package:nospy/widget/dashboard/dashboard_team_display.dart';
import 'package:nospy/widget/dashboard/dashboard.dart';
import 'package:nospy/widget/drawerwidget.dart';

class NoSpy extends StatelessWidget {
  const NoSpy({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('NoSpy')),
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "chat"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Teams'
          )
        ],
        onTap: (value){},
      ),
      body: DashBoard(),
    );
  }
}
