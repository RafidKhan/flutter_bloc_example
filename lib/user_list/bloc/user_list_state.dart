import 'package:flutter_bloc_example/models/user_model.dart';

class UserListState {
  const UserListState({
    required this.isLoading,
    required this.hasError,
    required this.users,
  });

  final bool isLoading;
  final bool hasError;
  final List<UserModel> users;

  UserListState copyWith({
    bool? isLoading,
    bool? hasError,
    List<UserModel>? users,
  }) {
    return UserListState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      users: users ?? this.users,
    );
  }
}
