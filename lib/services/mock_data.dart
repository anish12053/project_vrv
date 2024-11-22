import '../models/user.dart';
import '../models/role.dart';
import '../models/permission.dart';

final List<Permission> permissions = [
  Permission(id: '1', name: 'Read'),
  Permission(id: '2', name: 'Write'),
  Permission(id: '3', name: 'Delete'),
];

final List<Role> roles = [
  Role(id: '1', name: 'Admin', permissions: ['1', '2', '3']),
  Role(id: '2', name: 'Editor', permissions: ['1', '2']),
  Role(id: '3', name: 'Viewer', permissions: ['1']),
];

final List<User> users = [
  User(id: '1', name: 'John Doe', email: 'john@example.com', roleId: '1'),
  User(id: '2', name: 'Jane Smith', email: 'jane@example.com', roleId: '2'),
];
