class User {
  final String id;
  final String name;
  final String email;
  bool isActive;
  String roleId;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.isActive = true,
    required this.roleId,
  });
}
