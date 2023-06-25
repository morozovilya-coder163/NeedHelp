class RealUser {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? avatarUrl;

  const RealUser({
    required this.id,
    this.firstName,
    this.lastName,
    this.avatarUrl,
  });
}
