import 'package:flutter/material.dart';
import 'package:rabc_app/services/mock_data.dart';
import 'package:rabc_app/widgets/role_form.dart';

class RoleManagementScreen extends StatefulWidget {
  @override
  _RoleManagementScreenState createState() => _RoleManagementScreenState();
}

class _RoleManagementScreenState extends State<RoleManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Role Management")),
      body: ListView.builder(
        itemCount: roles.length,
        itemBuilder: (context, index) {
          final role = roles[index];
          return ListTile(
            title: Text(role.name),
            subtitle: Text("Permissions: ${role.permissions.join(', ')}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Open RoleForm for editing
                    showDialog(
                      context: context,
                      builder: (context) => RoleForm(
                        role: role, // Pass the current role for editing
                        onSave: (updatedRole) {
                          setState(() {
                            final index = roles.indexWhere((r) => r.id == role.id);
                            if (index != -1) {
                              roles[index] = updatedRole; // Update the role in the list
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
                    // Delete role
                    setState(() {
                      roles.remove(role); // Remove role from the list
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open RoleForm for adding a new role
          showDialog(
            context: context,
            builder: (context) => RoleForm(
              role: null, // Pass null for adding a new role
              onSave: (newRole) {
                setState(() {
                  roles.add(newRole); // Add the new role to the list
                });
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
