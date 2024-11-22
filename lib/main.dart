import 'package:flutter/material.dart';
import 'package:rabc_app/screens/dashboard.dart';
import 'package:rabc_app/screens/role_management.dart';
import 'package:rabc_app/screens/user_management.dart';

void main() {
  runApp(RBACApp());
}

class RBACApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RBAC Dashboard',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardScreen(),
        '/users': (context) => UserManagementScreen(),
        '/roles': (context) => RoleManagementScreen(),
      },
    );
  }
}
