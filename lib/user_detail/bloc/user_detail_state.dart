import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_example/models/user_model.dart';

class UserDetailState {
  final UserModel userModel;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController userNameController;

  const UserDetailState({
    required this.userModel,
    required this.nameController,
    required this.emailController,
    required this.userNameController,
  });

  UserDetailState copyWith({
    UserModel? userModel,
  }) {
    return UserDetailState(
      userModel: userModel ?? this.userModel,
      nameController: nameController,
      emailController: emailController,
      userNameController: userNameController,
    );
  }
}
