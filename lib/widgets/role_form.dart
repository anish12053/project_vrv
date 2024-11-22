import 'package:flutter/material.dart';
import 'package:rabc_app/models/role.dart';

class RoleForm extends StatefulWidget {
  final Role? role; // Null for adding, existing role for editing
  final Function(Role) onSave;

  RoleForm({this.role, required this.onSave});

  @override
  _RoleFormState createState() => _RoleFormState();
}

class _RoleFormState extends State<RoleForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late List<String> _permissions;

  @override
  void initState() {
    super.initState();
    _name = widget.role?.name ?? '';
    _permissions = widget.role?.permissions ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.role == null ? 'Add Role' : 'Edit Role'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _name,
              decoration: InputDecoration(labelText: 'Role Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a role name';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            TextFormField(
              initialValue: _permissions.join(', '),
              decoration: InputDecoration(labelText: 'Permissions (comma-separated)'),
              onSaved: (value) {
                _permissions = value!.split(',').map((p) => p.trim()).toList();
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget.onSave(
                Role(id: widget.role?.id ?? DateTime.now().toString(), name: _name, permissions: _permissions),
              );
              Navigator.of(context).pop();
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
