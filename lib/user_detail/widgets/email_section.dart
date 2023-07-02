import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/user_detail/bloc/user_detail_bloc.dart';
import 'package:flutter_bloc_example/user_detail/bloc/user_detail_state.dart';

class EmailSection extends StatelessWidget {
  const EmailSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailBloc, UserDetailState>(
        builder: (BuildContext context, state) {
          return Text(
            "Email: ${state.userModel?.email}",
            style: const TextStyle(fontSize: 18),
          );
        });
  }
}
