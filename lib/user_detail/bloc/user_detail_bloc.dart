import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_example/models/user_model.dart';
import 'package:flutter_bloc_example/user_detail/bloc/user_detail_state.dart';

class UserDetailBloc extends BlocBase<UserDetailState> {
  final UserModel userModel;

  UserDetailBloc({required this.userModel})
      : super(
          UserDetailState(
            userModel: userModel,
            nameController: TextEditingController(),
            emailController: TextEditingController(),
            userNameController: TextEditingController(),
            isSaveButtonEnabled: false,
          ),
        ) {
    state.nameController.addListener(() {
      checkSaveButtonStatus();
    });
    state.emailController.addListener(() {
      checkSaveButtonStatus();
    });
    state.userNameController.addListener(() {
      checkSaveButtonStatus();
    });
  }

  void updateData() {
    final String name = state.nameController.text.trim().isNotEmpty
        ? state.nameController.text.trim()
        : state.userModel.name;
    final String email = state.emailController.text.trim().isNotEmpty
        ? state.emailController.text.trim()
        : state.userModel.email;
    final String userName = state.userNameController.text.trim().isNotEmpty
        ? state.userNameController.text.trim()
        : state.userModel.username;

    emit(state.copyWith(
      userModel: state.userModel.copyWith(
        name: name,
        email: email,
        username: userName,
      ),
    ));
  }

  checkSaveButtonStatus() {
    if (state.nameController.text.trim().isEmpty &&
        state.emailController.text.trim().isEmpty &&
        state.userNameController.text.trim().isEmpty) {
      emit(state.copyWith(isSaveButtonEnabled: false));
    } else {
      emit(state.copyWith(isSaveButtonEnabled: true));
    }
  }
}
