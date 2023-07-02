import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/user_form/bloc/user_form_bloc.dart';
import 'package:flutter_bloc_example/user_form/bloc/user_form_state.dart';

class UserFormScreen extends StatelessWidget {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (_) => UserFormBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<UserFormBloc, UserFormState>(
            builder: (BuildContext context, UserFormState state) {
          final bloc = context.read<UserFormBloc>();
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: state.email,
                      decoration: const InputDecoration(labelText: "Email"),
                      onChanged: (value) {
                        formKey.currentState?.validate();
                      },
                      validator: (value) {
                        if (value != null) {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value.trim());
                          if (!emailValid) {
                            return "Please enter a valid email";
                          }
                        }

                        return null;
                      },
                    ),
                    TextField(
                      controller: state.password,
                      obscureText: state.isPasswordObscure,
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: bloc.togglePasswordObscureStatus,
                          icon: const Icon(
                            Icons.remove_red_eye_outlined,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: state.isValid
                          ? () {
                              FocusScope.of(context).unfocus();
                              bloc.loginUser(context);
                            }
                          : null,
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
