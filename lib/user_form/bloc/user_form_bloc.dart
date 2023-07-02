import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/user_form/bloc/user_form_state.dart';

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
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(state.email.text.trim());

    if (state.email.text.trim().isNotEmpty &&
        state.password.text.trim().isNotEmpty &&
        emailValid) {
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
