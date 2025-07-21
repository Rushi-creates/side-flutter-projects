import 'dart:convert';

class loginUser {
  String email;
  String password;
  loginUser({
    required this.email,
    required this.password,
  });

  loginUser copyWith({
    String? email,
    String? password,
  }) {
    return loginUser(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory loginUser.fromMap(Map<String, dynamic> map) {
    return loginUser(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory loginUser.fromJson(String source) =>
      loginUser.fromMap(json.decode(source));

  @override
  String toString() => 'loginUser(email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is loginUser &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
