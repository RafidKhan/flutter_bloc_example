import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/user_form/bloc/user_form_bloc.dart';
import 'package:flutter_bloc_example/user_form/bloc/user_form_state.dart';

class UserFormScreen extends StatelessWidget {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserFormBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<UserFormBloc, UserFormState>(
            builder: (BuildContext context, UserFormState state) {
          final bloc = context.read<UserFormBloc>();
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: state.name,
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: state.password,
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: state.isValid
                        ? () {
                            bloc.loginUser(context);
                          }
                        : null,
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
