class ApiRealUser {
  final String id;
  final String? firstName;
  final String? lastName;
  final String avatarUrl;

  ApiRealUser.fromApi(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        avatarUrl = json['avatarUrl'];

  Map<String, dynamic> toApi() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'avatarUrl': avatarUrl,
    };
  }
}
