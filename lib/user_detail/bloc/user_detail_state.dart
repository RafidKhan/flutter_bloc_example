import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_example/models/user_model.dart';

class UserDetailState {
  final UserModel userModel;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController userNameController;
  final bool isSaveButtonEnabled;

  const UserDetailState({
    required this.userModel,
    required this.nameController,
    required this.emailController,
    required this.userNameController,
    required this.isSaveButtonEnabled,
  });

  UserDetailState copyWith({
    UserModel? userModel,
    bool? isSaveButtonEnabled,
  }) {
    return UserDetailState(
      userModel: userModel ?? this.userModel,
      nameController: nameController,
      emailController: emailController,
      userNameController: userNameController,
      isSaveButtonEnabled: isSaveButtonEnabled ?? this.isSaveButtonEnabled,
    );
  }
}
