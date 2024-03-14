import 'package:flutter/material.dart';
import 'package:nospy/widget/settingPage/setting.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            accountName: Text("NoSpy"),
            accountEmail: Text('spy@nospy.com'),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          const ListTile(
            leading: Icon(Icons.group),
            title: Text('Teams'),
          ),
          const ListTile(
            leading: Icon(Icons.group_add),
            title: Text("Make your team"),
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => SettingsPage()),
                ),
              );
            },
            leading: const Icon(Icons.settings),
            title: const Text("Setting"),
          ),
          const ListTile(
            leading: Icon(Icons.announcement),
            title: Text('About'),
          )
        ],
      ),
    );
  }
}
