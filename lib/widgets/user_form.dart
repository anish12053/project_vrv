import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/mock_data.dart';

class UserForm extends StatefulWidget {
  final User? user;
  final Function(User) onSave;

  const UserForm({Key? key, this.user, required this.onSave}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _roleId;
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    _name = widget.user?.name ?? '';
    _email = widget.user?.email ?? '';
    _roleId = widget.user?.roleId ?? roles.first.id;
    _isActive = widget.user?.isActive ?? true;
  }

  void _saveForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      final newUser = User(
        id: widget.user?.id ?? DateTime.now().toString(),
        name: _name,
        email: _email,
        isActive: _isActive,
        roleId: _roleId,
      );
      widget.onSave(newUser);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.user == null ? 'Add User' : 'Edit User'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _name,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Name is required' : null,
              onSaved: (value) => _name = value ?? '',
            ),
            TextFormField(
              initialValue: _email,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Email is required' : null,
              onSaved: (value) => _email = value ?? '',
            ),
            const Spacer(),
            DropdownButtonFormField<String>(
              value: _roleId,
              decoration: InputDecoration(labelText: 'Role'),
              items: roles
                  .map((role) => DropdownMenuItem(
                        value: role.id,
                        child: Text(role.name),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => _roleId = value ?? ''),
            ),
            SwitchListTile(
              title: Text('Active'),
              value: _isActive,
              onChanged: (value) => setState(() => _isActive = value),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveForm,
          child: Text('Save'),
        ),
      ],
    );
  }
}
