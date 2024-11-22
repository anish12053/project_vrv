import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RBAC Dashboard")),
      body: const Center(child: Text("Welcome to the RBAC Dashboard")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('User Management'),
              onTap: () => Navigator.pushNamed(context, '/users'),
            ),
            ListTile(
              title: const Text('Role Management'),
              onTap: () => Navigator.pushNamed(context, '/roles'),
            ),
          ],
        ),
      ),
    );
  }
}
