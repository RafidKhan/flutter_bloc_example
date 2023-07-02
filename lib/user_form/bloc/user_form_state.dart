import 'package:flutter/cupertino.dart';

class UserFormState {
  const UserFormState({
    required this.name,
    required this.password,
    required this.isValid,
  });

  final TextEditingController name;
  final TextEditingController password;
  final bool isValid;

  UserFormState copyWith({
    TextEditingController? name,
    TextEditingController? password,
    bool? isValid,
  }) {
    return UserFormState(
      name: name ?? this.name,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }
}
