import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/user_form/bloc/user_form_state.dart';
import 'package:flutter_bloc_example/utils/extentions.dart';

class UserFormBloc extends BlocBase<UserFormState> {
  UserFormBloc()
      : super(UserFormState(
          email: TextEditingController(),
          password: TextEditingController(),
          isValid: false,
          isPasswordObscure: true,
        )) {
    state.email.addListener(() {
      isValid();
    });
    state.password.addListener(() {
      isValid();
    });
  }

  void isValid() {
    final bool emailValid = state.email.text.isValidEmail();
    final bool isValidPassword = state.password.text.isValidPassword();

    if (state.email.text.trim().isNotEmpty &&
        state.password.text.trim().isNotEmpty &&
        emailValid &&
        isValidPassword) {
      emit(state.copyWith(isValid: true));
    } else {
      emit(state.copyWith(isValid: false));
    }
  }

  loginUser(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Login Successful"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(state.email.text),
            Text(state.password.text),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              emit(
                state.copyWith(
                  email: TextEditingController(),
                  password: TextEditingController(),
                  isValid: false,
                  isPasswordObscure: true,
                ),
              );
              Navigator.pop(context);
            },
            child: const Text("Okay"),
          )
        ],
      ),
    );
  }

  togglePasswordObscureStatus() {
    emit(state.copyWith(isPasswordObscure: !state.isPasswordObscure));
  }
}
