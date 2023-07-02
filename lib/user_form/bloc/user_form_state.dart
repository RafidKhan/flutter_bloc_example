import 'package:flutter/cupertino.dart';

class UserFormState {
  const UserFormState({
    required this.email,
    required this.password,
    required this.isPasswordObscure,
    required this.isValid,
  });

  final TextEditingController email;
  final TextEditingController password;
  final bool isPasswordObscure;
  final bool isValid;

  UserFormState copyWith({
    TextEditingController? email,
    TextEditingController? password,
    bool? isPasswordObscure,
    bool? isValid,
  }) {
    return UserFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
      isValid: isValid ?? this.isValid,
    );
  }
}
