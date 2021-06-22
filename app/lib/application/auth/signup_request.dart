import 'package:flutter/foundation.dart';

class SignUpRequest {
  final String name;
  final String password;
  final String email;
  final String department;
  final String level;
  final String university;

  SignUpRequest({this.name,
    @required this.password,
    @required this.email,
    this.department,
    this.level,
    this.university}) {
    this.name.trim();
    this.email.trim();
    this.department.trim();
  }

  factory SignUpRequest.fromMap(Map<String, dynamic> map) {
    return new SignUpRequest(
      name: map['name'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      department: map['department'] as String,
      level: map['level'] as String,
      university: map['university'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'password': this.password,
      'email': this.email,
      'department': this.department,
      'level': this.level,
      'university': this.university,
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'SignUpRequest{name: $name, password: $password, email: $email, department: $department, level: $level, university: $university}';
  }
}
