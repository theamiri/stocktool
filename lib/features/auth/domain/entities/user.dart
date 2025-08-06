import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? displayName;

  const User({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.displayName,
  });

  String get fullName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    return displayName ?? email;
  }

  @override
  List<Object?> get props => [id, email, firstName, lastName, displayName];

  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? displayName,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      displayName: displayName ?? this.displayName,
    );
  }
}
