import 'package:flutter/material.dart';
import 'package:rabc_app/services/mock_data.dart';
import 'package:rabc_app/widgets/user_form.dart';

class UserManagementScreen extends StatefulWidget {
  @override
  _UserManagementScreenState createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Management")),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Role')),
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Actions')),
          ],
          rows: users.map((user) {
            return DataRow(cells: [
              DataCell(Text(user.name)), // Name column
              DataCell(Text(user.email)), // Email column
              DataCell(Text(getRoleNameById(user.roleId))), // Role column
              DataCell(
                Switch(
                  value: user.isActive,
                  onChanged: (value) {
                    setState(() {
                      user.isActive = value; // Update the status
                    });
                  },
                ),
              ),
              DataCell(
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Edit user
                        showDialog(
                          context: context,
                          builder: (context) => UserForm(
                            user: user,
                            onSave: (updatedUser) {
                              setState(() {
                                final index = users.indexWhere((u) => u.id == user.id);
                                if (index != -1) {
                                  users[index] = updatedUser; // Update user in the list
                                }
                              });
                            }, 
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Delete user
                        setState(() {
                          users.remove(user); // Remove user from the list
                        });
                      },
                    ),
                  ],
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new user
          showDialog(
            context: context,
            builder: (context) => UserForm(
              user: null, // Pass null to add a new user
              onSave: (newUser) {
                setState(() {
                  users.add(newUser); // Add user to the list
                });
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  String getRoleNameById(String roleId) {
    return roles.firstWhere((role) => role.id == roleId).name;
  }
}
