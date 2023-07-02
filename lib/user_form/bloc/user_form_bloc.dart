import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/user_form/bloc/user_form_state.dart';

part 'user_form_event.dart';

class UserFormBloc extends BlocBase<UserFormState> {
  UserFormBloc()
      : super(UserFormState(
          name: TextEditingController(),
          password: TextEditingController(),
          isValid: false,
        )) {
    state.name.addListener(() {
      isValid();
    });
    state.password.addListener(() {
      isValid();
    });
  }

  void isValid() {
    if (state.name.text.trim().isNotEmpty &&
        state.password.text.trim().isNotEmpty) {
      emit(state.copyWith(isValid: true));
    } else {
      emit(state.copyWith(isValid: false));
    }
  }

  loginUser(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${state.name.text} ${state.password.text}"),
    ));
  }
}
