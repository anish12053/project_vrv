import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/role.dart';

class AppState extends ChangeNotifier {
  List<User> _users = [];
  List<Role> _roles = [];

  AppState() {
    // Initialize with mock data
    _users = users;
    _roles = roles;
  }

  List<User> get users => _users;
  List<Role> get roles => _roles;

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void updateUser(User user) {
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
      notifyListeners();
    }
  }

  void deleteUser(String id) {
    _users.removeWhere((user) => user.id == id);
    notifyListeners();
  }

  void addRole(Role role) {
    _roles.add(role);
    notifyListeners();
  }

  void updateRole(Role role) {
    final index = _roles.indexWhere((r) => r.id == role.id);
    if (index != -1) {
      _roles[index] = role;
      notifyListeners();
    }
  }
}
