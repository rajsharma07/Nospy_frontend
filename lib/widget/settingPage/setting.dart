import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Settings'),

      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text(
              'General',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Navigate to General Settings Page
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Appearance'),
            onTap: () {
              // Navigate to Appearance Settings Page
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              // Navigate to Notifications Settings Page
            },
          ),
          ListTile(
            leading: const Icon(Icons.data_usage),
            title: const Text('Data & Storage'),
            onTap: () {
              // Navigate to Data & Storage Settings Page
            },
          ),
          const SizedBox(height: 10),
          Divider(
            thickness: 1.0,
            color: Colors.grey.withOpacity(0.5), // Adjusted the color of the divider
          ),
          ListTile(
            title: const Text(
              'User',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Navigate to User Settings Page
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () {
              // Navigate to Profile Settings Page
            },
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('Manage Contacts'),
            onTap: () {
              // Navigate to Manage Contacts Settings Page
            },
          ),
          const SizedBox(height: 10),
          Divider(
            thickness: 1.0,
            color: Colors.grey.withOpacity(0.5), // Adjusted the color of the divider
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            onTap: () {
              // Navigate to Help Page
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Feedback'),
            onTap: () {
              // Navigate to Feedback Page
            },
          ),
          ListTile(
            leading: const Icon(Icons.policy),
            title: const Text('Policies'),
            onTap: () {
              // Navigate to Policies Page
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy'),
            onTap: () {
              // Navigate to Privacy Page
            },
          ),
          const SizedBox(height: 10),
          Divider(
            thickness: 1.0,
            color: Colors.grey.withOpacity(0.5), // Adjusted the color of the divider
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sign Out'),
            onTap: () {
              // Implement Sign Out Functionality
            },
          ),
        ],
      ),
    );
  }
}
