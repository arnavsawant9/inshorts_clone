import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Language
          _buildSettingsItem(
            icon: Icons.language,
            title: 'Language',
            subtitle: 'English',
            onTap: () {
              // Handle language selection
            },
          ),
          Divider(),

          // Notifications
          _buildSettingsItem(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {
              // Handle notifications settings
            },
          ),
          Divider(),

          // Your Preferences
          _buildSettingsItem(
            icon: Icons.settings,
            title: 'Your Preferences',
            onTap: () {
              // Handle preferences
            },
          ),
          Divider(),

          // HD Images
          _buildSettingsItem(
            icon: Icons.hd,
            title: 'HD Images',
            onTap: () {
              // Handle HD images settings
            },
          ),
          Divider(),

          // Night Mode
          _buildSwitchItem(
            icon: Icons.nightlight_round,
            title: 'Night Mode',
            subtitle: 'For better readability at night',
            value: false, // Default value
            onChanged: (value) {
              // Handle night mode toggle
            },
          ),
          Divider(),

          // Autoplay
          _buildSwitchItem(
            icon: Icons.play_circle_filled,
            title: 'Autoplay',
            subtitle: 'Off',
            value: false, // Default value
            onChanged: (value) {
              // Handle autoplay toggle
            },
          ),
          Divider(),

          // Text Size
          _buildSettingsItem(
            icon: Icons.text_fields,
            title: 'Text Size',
            subtitle: 'Default',
            onTap: () {
              // Handle text size settings
            },
          ),
          Divider(),

          // Share this app
          _buildSettingsItem(
            icon: Icons.share,
            title: 'Share this app',
            onTap: () {
              // Handle share functionality
            },
          ),
        ],
      ),
    );
  }

  // Helper method to build a settings item with an icon and text
  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: TextStyle(fontSize: 16)),
      subtitle: subtitle != null ? Text(subtitle) : null,
      onTap: onTap,
    );
  }

  // Helper method to build a settings item with a switch
  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: TextStyle(fontSize: 16)),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}