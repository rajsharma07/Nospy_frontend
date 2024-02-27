import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            accountName: Text("Tatte Idli"),
            accountEmail: Text('Idli@tatte.com'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Teams'),
          ),
          ListTile(
            leading: Icon(Icons.group_add),
            title: Text("Make your team"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Setting"),
          ),
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text('About'),
          )
        ],
      ),
    );
  }
}
