class Role {
  final String id;
  final String name;
  List<String> permissions;

  Role({
    required this.id,
    required this.name,
    required this.permissions,
  });
}
